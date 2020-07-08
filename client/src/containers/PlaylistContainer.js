import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doPlaylistRequesting } from "../redux/actions/playlistActions";
import {
  getPlaylistMovies,
  getPlaylistTitle,
  getPlaylistErrors
} from "../redux/selectors/selectors";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
// material-ui
import Grid from "@material-ui/core/Grid";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    justify: "space-around",
    alignItems: "center",
    margin: theme.spacing.unit * 6,
    marginTop: theme.spacing.unit * 2
  },
  tile: {
    height: 0,
    padding: "56.25% 0 0 0",
    maxWidth: 500
  },
  grid: {
    marginBottom: theme.spacing.unit * 5,
    borderBottomStyle: "solid",
    borderColor: "#ecca00"
  },
  type: {
    color: "#ecca00"
  }
});

class PlaylistContainer extends Component {
  componentDidMount() {
    this.props.doPlaylistRequesting(this.props.match.params.id);
  }

  render() {
    const {
      classes,
      width,
      playlistTitle,
      playlistMovies,
      playlistErrors
    } = this.props;
    //Provides breakpoints for number of movies per row according to screen size
    const columns = {
      xs: 2,
      sm: 3,
      md: 4,
      lg: 6,
      xl: 8
    };

    // if (playlistErrors.code === 4044) {
    //   return <Redirect to="/ms/playlists" />;
    // }

    let resize = 1;
    let length = Object.keys(playlistMovies).length;
    if (length < 3 && columns[width] >= 3) {
      switch (length) {
        case 1:
        case 2:
          resize = 3;
          break;
        default:
          break;
      }
    }

    let card = 0;
    let movies = Object.values(playlistMovies).map(movie => {
      let imageUrl = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={resize}>
          <MovieCard
            id={movie.id}
            key={card}
            movie={movie}
            imageUrl={imageUrl}
          />
        </GridListTile>
      );
    });

    return (
      <>
        <div className={classes.root}>
          <Grid container item xs={12} className={classes.grid}>
            <Typography component="h2" variant="h4" className={classes.type}>
              {playlistTitle}
            </Typography>
          </Grid>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
        <Notifications>{playlistErrors}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  playlistTitle: getPlaylistTitle(state, props.match.params.id),
  playlistMovies: getPlaylistMovies(state),
  playlistErrors: getPlaylistErrors(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doPlaylistRequesting }
  )(withWidth()(withStyles(styles)(PlaylistContainer)))
);
