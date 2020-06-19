import React, { useState, useEffect } from "react";
import { connect } from "react-redux";
import { useMultiApi, useApi } from "../util/CustomHooks";
import { doUserRequesting } from "../redux/actions/userActions";
import { getUser, getRatingsList } from "../redux/selectors/selectors";
import ProgressIndicator from "./ProgressIndicator";
// material-ui
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
// fullWidth={this.state.fullWidth}
// maxWidth={this.state.maxWidth}

const styles = theme => ({
  grid: {
    flex: 1
  }
});

const BrokenImages = ({ open, setOpen, selected, classes, records }) => {
  const [progress, setProgress] = useState(false);
  const [workingImages, setWorkingImages] = useState([]);
  const [brokenImages, setBrokenImages] = useState([]);
  const [isSearching, setIsSearching] = useState(false);
  const [completed, setCompleted] = useState(0);
  const [username, setUsername] = useState("");
  // const [images, imageData] = useState();

  const [
    { apiData, isLoading, isError },
    doFetch,
    doHeader,
    setApiData
  ] = useApi("", {});

  const [
    { multiApiData, isMultiLoading, isMultiError },
    doMultiFetch,
    doMultiHeader,
    setMutliApiData,
    setIds
  ] = useMultiApi("", {});

  useEffect(() => {
    if (open) return;
    return () => {
      setApiData(null);
      setCompleted(0);
      setWorkingImages([]);
      setBrokenImages([]);
    };
  }, [
    open,
    apiData,
    setApiData,
    completed,
    workingImages,
    brokenImages,
    setWorkingImages
  ]);

  useEffect(() => {
    if (records.length !== 0 && selected.length !== 0) {
      // let stringData = localStorage.getItem("state");
      // const data = JSON.parse(stringData);
      // data.user.profile.username
      // setUsername(records[selected[0]].username);
      // for (let item in ratings) setImageData({});

      const user = records.find(el => el.id === selected[0]);
      setUsername(user.username);
    }
    doHeader(header);
    doMultiHeader(multiHeader);
  }, [
    doHeader,
    doMultiHeader,
    header,
    multiHeader,
    records,
    selected,
    username
  ]);

  const api = `${process.env.REACT_APP_API_URL}/api/v1/playlists/images/${
    selected[0]
  }`;
  const multiApi = `https://api.themoviedb.org/3/movie`;
  const header = {
    credentials: "same-origin",
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${sessionStorage.jwt}`
    }
  };
  const multiHeader = {
    credentials: "same-origin",
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  };

  useEffect(() => {
    if (!apiData) return;
    setIsSearching(true);
    function testImage(url) {
      // Define the promise
      const imgPromise = new Promise(function imgPromise(resolve, reject) {
        // Create the image
        const imgElement = new Image();

        // When image is loaded, resolve the promise
        imgElement.addEventListener("load", function imgOnLoad() {
          resolve(this);
        });

        // When there's an error during load, reject the promise
        imgElement.addEventListener("error", function imgOnError() {
          reject();
        });

        // Assign URL
        imgElement.src = "https://image.tmdb.org/t/p/w500" + url;
      });

      return imgPromise;
    }

    if (workingImages.length === 0 && brokenImages.length === 0) {
      for (let item of apiData.images) {
        testImage(item[1]).then(
          function fulfilled(img) {
            console.log("That image is found and loaded", img);
            setWorkingImages(workingImages => [item, ...workingImages]);
            setCompleted(completed => completed + 1);
          },

          function rejected() {
            console.log("That image was not found");
            setBrokenImages(brokenImages => [item, ...brokenImages]);
            setCompleted(completed => completed + 1);
          }
        );
      }
    }
    console.log(workingImages);
    console.log(brokenImages);
    return () => {
      setIsSearching(false);
    };
  }, [apiData, brokenImages, workingImages]);

  useEffect(() => {
    if (multiApiData.length === 0) return;
    const data = multiApiData.map(el => {
      return { id: el.id, poster_path: el.poster_path };
    });
    doHeader({
      credentials: "same-origin",
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.jwt}`
      },
      body: JSON.stringify({ images: data })
    });
    doFetch(`${process.env.REACT_APP_API_URL}/api/v1/movies/:id`);
    multiApiData([]);
  }, [multiApiData, doFetch, doHeader]);

  const handleFix = () => {
    setIds(brokenImages.map(el => el[0]));
    doMultiFetch(multiApi);
    setProgress(true);
  };

  console.log(completed);
  console.log(brokenImages);
  console.log(apiData);
  return (
    <Dialog
      open={open}
      onClose={() => setOpen(false)}
      aria-labelledby="max-width-dialog-title"
    >
      <DialogTitle id="max-width-dialog-title">
        Find & Fix Broken Images for {username}
      </DialogTitle>
      <DialogContent>
        <Grid
          container
          className={classes.grid}
          justify="space-around"
          alignItems="center"
        >
          <Grid item xs={4} align="center">
            <Button
              color="secondary"
              variant="contained"
              fullWidth
              onClick={() => setOpen(false)}
            >
              Cancel
            </Button>
          </Grid>
          <Grid item xs={4} align="center">
            {completed === 0 ||
            completed < workingImages.length + brokenImages.length ? (
              <Button
                color="primary"
                variant="contained"
                fullWidth
                onClick={() => {
                  doFetch(api);
                  setProgress(true);
                }}
              >
                Find
              </Button>
            ) : (
              <Button
                color="primary"
                variant="contained"
                fullWidth
                onClick={handleFix}
              >
                Fix
              </Button>
            )}
          </Grid>
          <Grid item xs={12}>
            <ProgressIndicator
              brokenImages={brokenImages}
              workingImages={workingImages}
              progress={progress}
              setProgress={setProgress}
              completed={completed}
              setCompleted={setCompleted}
              apiData={apiData}
              setApiData={setApiData}
              isSearching={isSearching}
            />
          </Grid>
          {isSearching ? (
            <>
              <Grid item xs={6}>
                <Typography>Working: {workingImages.length}</Typography>
              </Grid>
              <Grid item xs={6}>
                <Typography>Broken: {brokenImages.length}</Typography>
              </Grid>
            </>
          ) : null}
        </Grid>
      </DialogContent>
    </Dialog>
  );
};

const mapStateToProps = (state, props) => ({
  user: getUser(state)
});
// playlistMovieIds: getPlaylistMovieIds(state),
export default connect(
  mapStateToProps,
  null
)(withStyles(styles)(BrokenImages));

// <DialogActions>
//   <Button onClick={() => setOpen(false)} color="primary">
//     Close
//   </Button>
// </DialogActions>
