import React from "react";
import { Grid, Typography, withStyles, withWidth } from "@material-ui/core";

const styles = theme => ({
  title: {
    flex: 1
  },
  type: {
    color: "#ecca00",
    fontWeight: "900",
    fontFamily: "'NewTimesRoman', serif"
  }
});

const Title = props => {
  const { classes, width } = props;
  const header = {
    xs: "h3",
    sm: "h2",
    md: "h1",
    lg: "h1",
    xl: "h1"
  };

  console.log(width);
  return (
    <>
      <Grid
        container
        className={classes.title}
        alignItems="center"
        justify="center"
      >
        <Typography
          component="h1"
          variant={header[width]}
          align="center"
          className={classes.type}
          gutterBottom
        >
          MOVIE
        </Typography>
        <Typography
          id="rotate"
          component="h1"
          variant={header[width]}
          align="center"
          className={classes.type}
          gutterBottom
        >
          {"  "}S{"  "}
        </Typography>
        <Typography
          component="h1"
          variant={header[width]}
          align="center"
          className={classes.type}
          gutterBottom
        >
          CENE
        </Typography>
      </Grid>
    </>
  );
};

export default withWidth()(withStyles(styles)(Title));
