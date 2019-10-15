import React from "react";
import Stars from "./Stars";
import Image from "../assets/brushed-metal.jpg";
import FullCast from "../components/FullCast";
//material-ui
import AddIcon from "@material-ui/icons/Add";
import Button from "@material-ui/core/Button";
import CheckIcon from "@material-ui/icons/Check";
import ClearIcon from "@material-ui/icons/Clear";
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Tooltip from "@material-ui/core/Tooltip";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flex: 1,
    justifyContent: "space-around",
    alignItems: "flex-start"
  },
  buttonOne: {
    color: "#E8E8E8",
    backgroundColor: "#E50000"
  },
  buttonTwo: {
    color: "#E8E8E8",
    backgroundColor: "#4B0082"
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
  },
  cast: {
    color: "#2F4F4F",
    fontWeight: "600"
  },
  members: {
    fontSize: 15,
    margin: theme.spacing.unit
  },
  castLayout: {
    padding: theme.spacing.unit * 3,
    margin: theme.spacing.unit * 3,
    background: `url(${Image})`
  },
  main: {
    // flex: 1
    // flexWrap: "nowrap"
  }
});

const Movie = props => {
  const {
    classes,
    movie,
    profile,
    cast,
    imageUrl,
    check,
    handlePlaylistClick,
    handleRatingClick,
    activePlaylist
  } = props;

  let firstCut = cast.length > 10 ? cast.slice(0, 11) : cast;
  let movieCast = firstCut.map((member, idx) => {
    return (
      <Grid item xs={4} md={12} key={idx}>
        <Typography className={classes.members}>{member}</Typography>
      </Grid>
    );
  });

  return (
    <Grid container display="flex" justify="space-evenly">
      <Grid item xs={12} md={8}>
        <Paper className={classes.layout}>
          <Grid container className={classes.root} spacing={16}>
            <Grid item xs={12} sm={5} className={classes.grid}>
              <img
                src={imageUrl}
                className={classes.media}
                alt="movie poster"
              />
              {!profile ? (
                <>
                  <Paper className={classes.stars}>
                    <Stars id={movie.id} movie={movie} starSize={20} />
                  </Paper>
                  <Grid container>
                    <Grid item xs={6}>
                      <Tooltip title="Clear rating" placement="bottom">
                        <Button
                          className={classes.buttonOne}
                          component={Paper}
                          alt="clear rating"
                          fullWidth
                          onClick={() => {
                            handleRatingClick(movie);
                          }}
                        >
                          <ClearIcon />
                        </Button>
                      </Tooltip>
                    </Grid>
                    <Grid item xs={6}>
                      <Tooltip
                        title={
                          check ? "Remove from playlist" : "Add to playlist"
                        }
                        placement="bottom"
                      >
                        <Button
                          className={classes.buttonTwo}
                          component={Paper}
                          alt="clear rating"
                          fullWidth
                          onClick={() => {
                            handlePlaylistClick(check, activePlaylist, movie);
                          }}
                        >
                          {check ? <CheckIcon /> : <AddIcon />}
                        </Button>
                      </Tooltip>
                    </Grid>
                  </Grid>
                </>
              ) : null}
            </Grid>
            <Grid item sm={7}>
              <Typography variant="h4" className={classes.title}>
                {movie.title || movie.name}
              </Typography>
              <Typography
                component="p"
                align="center"
                className={classes.overview}
              >
                {movie.overview || movie.description}
              </Typography>
            </Grid>
          </Grid>
        </Paper>
      </Grid>
      <Grid item xs={12} md={3} className={classes.castLayout}>
        <Typography className={classes.cast} variant="h6" align="center">
          Cast
        </Typography>
        <Grid container>{movieCast}</Grid>
        <FullCast movieTitle={movie.title || movie.name} cast={cast} />
      </Grid>
    </Grid>
  );
};

export default withStyles(styles)(Movie);
