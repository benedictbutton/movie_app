import React from "react";
import { withRouter } from "react-router-dom";
import Stars from "./Stars";
import Image from "../assets/brushed-metal.jpg";
//material-ui
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flex: 1,
    justifyContent: "space-around",
    alignItems: "flex-start"
  },
  layout: {
    padding: theme.spacing.unit * 3,
    margin: theme.spacing.unit * 3,
    background: `url(${Image})`
  },
  grid: {
    height: "auto",
    padding: "56.25% 0 0 0",
    maxWidth: 300
  },
  media: {
    width: "100%",
    height: "100%"
  },
  stars: {
    background: "rgba(0, 0, 0, 0.5)",
    maxHeight: 48
  },
  overview: {
    color: "#343434"
  },
  title: {
    marginBottom: theme.spacing.unit * 3,
    color: "#2F4F4F",
    fontWeight: "700"
  }
});

const Movie = props => {
  const { classes } = props;
  let { id, title, imageUrl, overview } = props.location.state;

  return (
    <Grid container display="flex">
      <Grid item xs={12} md={8}>
        <Paper className={classes.layout}>
          <Grid container className={classes.root} spacing={16}>
            <Grid item xs={12} sm={5} className={classes.grid}>
              <img src={imageUrl} className={classes.media} />
              <Paper className={classes.stars}>
                <Stars id={id} starSize={20} />
              </Paper>
            </Grid>
            <Grid item sm={7}>
              <Typography variant="h4" className={classes.title}>
                {title}
              </Typography>
              <Typography
                component="p"
                align="center"
                className={classes.overview}
              >
                {overview}
              </Typography>
            </Grid>
          </Grid>
        </Paper>
      </Grid>
    </Grid>
  );
};

export default withRouter(withStyles(styles)(Movie));
