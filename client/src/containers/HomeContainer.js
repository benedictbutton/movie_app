import React from "react";
import { Link } from "react-router-dom";
//material-ui
import { Grid, Paper, withStyles } from "@material-ui/core";

const styles = theme => ({
  // root: {
  //   backgroundImage: `url(${Image})`,
  //   flexGrow: "1",
  //   flexWrap: "wrap",
  //   maxWidth: "100%"
  // },
  paper: {
    padding: theme.spacing.unit * 2,
    align: "center"
  }
});

const HomeContainer = props => {
  const { classes } = props;

  return (
    <Grid container className="home">
      <Grid item xs={2}>
        <Paper className={classes.paper}>
          <Link to="/ms/sign-up">Sign Up</Link>
        </Paper>
      </Grid>
      <Grid item xs={2}>
        <Paper className={classes.paper}>
          <Link to="/ms/sign-in">Log In</Link>
        </Paper>
      </Grid>
    </Grid>
  );
};

export default withStyles(styles)(HomeContainer);
