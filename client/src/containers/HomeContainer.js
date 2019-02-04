import React from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Image from "../assets/brushed-metal.jpg";
import Title from "../components/Title";
//material-ui
import { Button, Grid, Typography, withStyles } from "@material-ui/core";

const styles = theme => ({
  // root: {
  //   backgroundImage: `url(${Image})`,
  //   flexGrow: "1",
  //   flexWrap: "wrap",
  //   maxWidth: "100%"
  // },
  button: {
    display: "flex",
    padding: theme.spacing.unit * 2,
    backgroundImage: `url(${Image})`,
    borderColor: "grey",
    borderStyle: "solid",
    borderWidth: 5
  },
  label: {
    align: "center",
    marginRight: theme.spacing.unit * 2
  }
});

const HomeContainer = props => {
  const { classes } = props;

  return (
    <Grid container className="home" direction="column">
      <Grid item>
        <Title />
        <Grid />
        <Grid item>
          <Grid container alignItems="center" justify="center">
            <Grid item>
              <Link to="/ms/sign-up" style={{ textDecoration: "none" }}>
                <Button
                  className={classes.button}
                  variant="contained"
                  size="large"
                >
                  <Typography className={classes.label} variant="headline">
                    Sign Up
                  </Typography>
                  <Typography>
                    <FontAwesomeIcon icon="play" size="2x" />
                  </Typography>
                </Button>
              </Link>
            </Grid>
            <Grid item>
              <Link to="/ms/sign-in" style={{ textDecoration: "none" }}>
                <Button
                  className={classes.button}
                  variant="contained"
                  size="large"
                >
                  <Typography className={classes.label} variant="headline">
                    Sign In
                  </Typography>
                  <Typography>
                    <FontAwesomeIcon icon="step-forward" size="2x" />
                  </Typography>
                </Button>
              </Link>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </Grid>
  );
};

export default withStyles(styles)(HomeContainer);
