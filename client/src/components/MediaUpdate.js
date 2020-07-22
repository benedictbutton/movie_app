import React, { useState, useEffect, useCallback } from "react";
import RatingsUpdate from "./RatingsUpdate";
import SearchField from "./SearchField";
import Button from "@material-ui/core/Button";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import { useMultiApi, useApi } from "../util/CustomHooks";
import { withStyles } from "@material-ui/core/styles";
import GreyImage from "../assets/brushed-metal.jpg";

const styles = theme => ({
  grid: {
    flex: 1,
    backgroundImage: `url(${GreyImage})`
  },
  type: {
    color: "#3f51b5",
    margin: theme.spacing.unit * 2
  },
  button: {
    margin: theme.spacing.unit,
    minWidth: 400
  }
});

const MediaUpdate = ({ classes }) => {
  const [getMovies, setGetMovies] = useState(false);
  const [numOfMovies, setNumOfMovies] = useState(0);
  const [update, setUpdate] = useState(false);
  const [values, setValues] = useState([]);

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
    setCount,
    setRequestType
  ] = useMultiApi("", {});

  const dbMovies = `${process.env.REACT_APP_API_URL}/api/v1/playlists/all_movies`;
  const myMovieDbData = `https://api.themoviedb.org/3`;

  const dbHeader = {
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
    if (!update) return;
    console.log("values", values);

    const api = `${process.env.REACT_APP_API_URL}/api/v1/movies/:id`;
    const header = {
      credentials: "same-origin",
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.jwt}`
      },
      body: JSON.stringify({ media: values })
    };
    doFetch(api);
    doHeader(header);
    setUpdate(false);
  }, [doFetch, doHeader, update, values]);

  useEffect(() => {
    if (!getMovies || !apiData) return;
    // const len = apiData.length;
    // getLength(len);
    setGetMovies(false);
    setNumOfMovies(apiData.movies.length);
  }, [apiData, dbHeader, dbMovies, doFetch, doHeader, getMovies]);

  useEffect(() => {
    if (!multiApiData) return;
    let mediaData = multiApiData.map(
      el =>
        ({ id: el.results[0].id, media_type: el.results[0].media_type } ||
        "***")
    );

    setValues([
      ...multiApiData.map(
        el =>
          ({ id: el.results[0].id, media_type: el.results[0].media_type } ||
          "***")
      ),
      ...values
    ]);

    setMultiApiData(null);
    if (count < numOfMovies) {
      // cooncern about hitting rate limits
      console.log("count: ", count);
      setTimeout(() => {
        handleMovieDb();
      }, 30000);
    }
    return;
  }, [
    apiData,
    count,
    dbHeader,
    dbMovies,
    doFetch,
    doHeader,
    getMovies,
    handleMovieDb,
    multiApiData,
    numOfMovies,
    setMultiApiData,
    values
  ]);

  useEffect(() => {
    setRequestType("media");
  }, [setRequestType]);

  const handleMovieDb = useCallback(() => {
    let batch = apiData.movies.slice(count, count + 30);
    setCount(count => count + 30);
    setIds(batch);
    doMultiHeader(multiHeader);
    doMultiFetch(myMovieDbData);
  });

  console.log("apiData: ", apiData);

  return (
    <Grid
      container
      direction="column"
      className={classes.grid}
      alignItems="center"
      justify="flex-start"
    >
      <Grid item xs={12}>
        <Typography variant="h3" className={classes.type}>
          Update Media Type{" "}
        </Typography>
      </Grid>
      <Grid item xs={12}>
        <Button
          variant="outlined"
          fullWidth
          className={classes.button}
          color="primary"
          onClick={() => {
            doHeader(dbHeader);
            doFetch(dbMovies);
            setGetMovies(true);
          }}
        >
          Get DB Movies
        </Button>
      </Grid>
      <Grid item xs={12}>
        <Button
          variant="outlined"
          fullWidth
          className={classes.button}
          color="primary"
          onClick={handleMovieDb}
        >
          Get Media Types
        </Button>
      </Grid>
      <Grid item xs={12}>
        <Button
          variant="outlined"
          fullWidth
          className={classes.button}
          color="primary"
          onClick={() => setUpdate(true)}
        >
          Update Movies
        </Button>
      </Grid>
      <RatingsUpdate />
    </Grid>
  );
};

export default withStyles(styles)(MediaUpdate);
