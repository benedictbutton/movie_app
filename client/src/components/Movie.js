import React from "react";
import { Link } from "react-router-dom";
import classNames from "classnames";
import ActivePlaylistContainer from "../containers/ActivePlaylistContainer";
import Image from "../assets/brushed-metal.jpg";
import FullCast from "../components/FullCast";
import Stars from "./Stars";
import Trailers from "../components/Trailers";
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
  // side: {
  //   flex: 1
  // },
  buttonOne: {
    color: "#E8E8E8",
    backgroundColor: "#E50000"
  },
  buttonTwo: {
    color: "#E8E8E8",
    backgroundColor: "#4B0082"
  },
  chip: {
    marginTop: theme.spacing.unit * 2,
    marginLeft: theme.spacing.unit * 7,
    [theme.breakpoints.down(600)]: {
      justifyContent: "center",
      alignItems: "center",
      marginLeft: 0
    }
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
    color: "#343434",
    marginBottom: theme.spacing.unit * 5
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
    background: `url(${Image})`,
    borderRadius: 3
  }
});

const Movie = props => {
  const {
    id,
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
        <Link
          to={{
            pathname: `/ms/person/${member.id}`,
            state: { name: member.name, imageUrl: imageUrl }
          }}
          style={{ textDecoration: "none" }}
        >
          <Typography className={classes.members}>{member.name}</Typography>
        </Link>
      </Grid>
    );
  });

  return (
    <>
      <Grid container item xs={12} className={classes.chip}>
        <ActivePlaylistContainer />
      </Grid>
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
                <Paper className={classes.stars}>
                  <Stars id={id} movie={movie} starSize={20} />
                </Paper>
                <Grid container>
                  <Grid item xs={6}>
                    <Tooltip title="Clear rating" placement="bottom">
                      <Button
                        className={classes.buttonOne}
                        component={Paper}
                        alt="clear stars"
                        fullWidth
                        onClick={() => {
                          handleRatingClick(id);
                        }}
                      >
                        <ClearIcon />
                      </Button>
                    </Tooltip>
                  </Grid>
                  <Grid item xs={6}>
                    <Tooltip
                      title={check ? "Remove from playlist" : "Add to playlist"}
                      placement="bottom"
                    >
                      <Button
                        id="btn"
                        className={classes.buttonTwo}
                        component={Paper}
                        alt="clear playlist"
                        fullWidth
                        onClick={() => {
                          handlePlaylistClick(check, activePlaylist, movie, id);
                        }}
                      >
                        {check ? <CheckIcon /> : <AddIcon />}
                      </Button>
                    </Tooltip>
                  </Grid>
                </Grid>
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
    </>
  );
};

export default withStyles(styles)(Movie);
