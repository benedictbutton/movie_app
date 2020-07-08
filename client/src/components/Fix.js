import React, { useState, useEffect, useCallback } from "react";
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

const Fix = ({ classes }) => {
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

  useEffect(() => {
    if (!update) return;
    const api = `${process.env.REACT_APP_API_URL}/api/v1/movies/:id`;
    const header = {
      credentials: "same-origin",
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.jwt}`
      }
    };
    doFetch(api);
    doHeader(header);
    setUpdate(false);
  }, [doFetch, doHeader, update]);

  console.log(apiData);
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
          Fix
        </Typography>
      </Grid>
      <Grid item xs={12}>
        <Button
          variant="outlined"
          fullWidth
          className={classes.button}
          color="primary"
          onClick={() => setUpdate(true)}
        >
          Apply Fix
        </Button>
      </Grid>
    </Grid>
  );
};

export default withStyles(styles)(Fix);
