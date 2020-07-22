import React, { useState } from "react";
import { useApi } from "../util/CustomHooks";
import Button from "@material-ui/core/Button";
import Grid from "@material-ui/core/Grid";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  button: {
    margin: theme.spacing.unit,
    minWidth: 400
  }
});

const RatingsUpdate = ({ classes }) => {
  const [
    { apiData, isLoading, isError },
    doFetch,
    doHeader,
    setApiData
  ] = useApi("", {});

  const api = `${process.env.REACT_APP_API_URL}/api/v1/ratings/:id
  }`;

  const header = {
    credentials: "same-origin",
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${sessionStorage.jwt}`
    }
  };

  console.log(apiData || "testing");

  return (
    <Grid item xs={12}>
      <Button
        variant="outlined"
        fullWidth
        className={classes.button}
        color="primary"
        onClick={() => {
          doHeader(header);
          doFetch(api);
        }}
      >
        Update Stars
      </Button>
    </Grid>
  );
};

export default withStyles(styles)(RatingsUpdate);
