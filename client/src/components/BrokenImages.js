import React, { useState, useEffect, useCallback } from "react";
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
  const [workingImages, setWorkingImages] = useState([]);
  const [brokenImages, setBrokenImages] = useState([]);
  const [step, setStep] = useState(0);
  const [max, setMax] = useState(10000);
  const [username, setUsername] = useState("");
  const [buttonAction, setButtonAction] = useState("find");
  const [isSearching, setIsSearching] = useState(false);
  const [isFinding, setIsFinding] = useState(false);
  const [isFixing, setIsFixing] = useState(false);

  // const [images, imageData] = useState();

  const [
    { apiData, isLoading, isError },
    doFetch,
    doHeader,
    setApiData
  ] = useApi("", {});

  const [
    { multiApiData, isMultiLoading, isMultiError, count },
    doMultiFetch,
    doMultiHeader,
    setMultiApiData,
    setIds,
    setCount
  ] = useMultiApi("", {});

  useEffect(() => {
    if (open) return;
    return () => {
      setApiData(null);
      setMultiApiData(null);
      setIsSearching(false);
      setWorkingImages([]);
      setBrokenImages([]);
    };
  }, [
    open,
    apiData,
    setApiData,
    workingImages,
    brokenImages,
    setWorkingImages,
    setMultiApiData
  ]);

  useEffect(() => {
    // if (records.length !== 0 && selected.length !== 0) {
    // let stringData = localStorage.getItem("state");
    // const data = JSON.parse(stringData);
    // data.user.profile.username
    // setUsername(records[selected[0]].username);
    // for (let item in ratings) setImageData({});
    if (records.length === 0 && selected.length === 0) return;
    const user = records.find(el => el.id === selected[0]);
    setUsername(user.username);
    // }
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
  const multiApi = `https://api.themoviedb.org/3`;
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
    if (!isSearching) return;

    // setMax(apiData.images.length);
    // setIsSearching(true);

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

    if (!apiData) return;
    setMax(apiData.images.length);
    for (let item of apiData.images) {
      testImage(item[1]).then(
        function fulfilled(img) {
          console.log("That image is found and loaded", img);
          setWorkingImages(workingImages => [item, ...workingImages]);
          setStep(step => step + 1);
        },

        function rejected() {
          console.log("That image was not found");
          setBrokenImages(brokenImages => [item, ...brokenImages]);
          setStep(step => step + 1);
        }
      );
    }
    console.log(workingImages);
    console.log(brokenImages);
    setIsSearching(false);
    setIsFixing(true);
    return;
  }, [apiData, isSearching, brokenImages, setStep, workingImages]);

  useEffect(() => {
    if (!multiApiData || multiApiData.length === 0) return;
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
    setMultiApiData(null);
  }, [multiApiData, doFetch, doHeader, setMultiApiData, brokenImages.length]);

  // trigger handleFix() to continue fixing broken images
  useEffect(() => {
    if (!apiData || count + 30 > brokenImages.length) return;
    handleFix();
  }, [apiData, brokenImages.length, count, handleFix]);

  // useEffect(() => {
  //   if (!apiData) return;
  //   if (apiData.images.length !== workingImages.length + brokenImages.length)
  //     return;
  //   setButtonAction("fix");
  // }, [apiData, brokenImages.length, workingImages.length]);

  const handleFix = useCallback(() => {
    if (brokenImages.length === 0) return;
    setMax(brokenImages.length);
    setStep(count);
    const batch = brokenImages.slice(count, count + 30);
    setCount(count => count + 30);
    setIds(batch);
    doMultiFetch(multiApi);
  });

  console.log(brokenImages);
  console.log("apiData: ", apiData);
  console.log("isSearching:", isSearching);
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
            {isFixing ? (
              <Button
                color="primary"
                variant="contained"
                fullWidth
                onClick={handleFix}
              >
                Fix
              </Button>
            ) : (
              <Button
                color="primary"
                variant="contained"
                fullWidth
                onClick={() => {
                  doFetch(api);
                  setIsSearching(true);
                  setIsFinding(true);
                }}
              >
                Find
              </Button>
            )}
          </Grid>
          <Grid item xs={12}>
            <ProgressIndicator step={step} max={max} setStep={setStep} />
          </Grid>

          {isFinding && (
            <>
              <Grid item xs={6}>
                <Typography>Working: {workingImages.length}</Typography>
              </Grid>
              <Grid item xs={6}>
                <Typography>Broken: {brokenImages.length}</Typography>
              </Grid>
            </>
          )}
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
