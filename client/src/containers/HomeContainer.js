import React, { Component } from "react";
import { Link } from "react-router-dom";
import SignInContainer from "./SignInContainer";
import SignUpContainer from "./SignUpContainer";

//material-ui
import { Grid, Paper, withStyles } from "@material-ui/core";

const styles = theme => ({
  paper: {
    padding: theme.spacing.unit * 2,
    align: "center",
    color: theme.palette.text.secondary
  }
});

const HomeContainer = props => {
  const { classes } = props;

  return (
    <Grid container spacing={40} alignItems="center" justify="center">
      <Grid item xs={2}>
        <Paper className={classes.paper}>
          <Link to="/sign-up">Sign Up</Link>
        </Paper>
      </Grid>
      <Grid item xs={2}>
        <Paper className={classes.paper}>
          <Link to="/login">Log In</Link>
        </Paper>
      </Grid>
    </Grid>
  );
};

export default withStyles(styles)(HomeContainer);
