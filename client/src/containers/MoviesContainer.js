import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reset } from "redux-form";
import { doRatingAdd } from "../redux/actions/ratingActions";
import {
  doMoviesRequesting,
  doMovieCategoryRequesting,
  doMovieSearchRequesting,
  doUpdateGenre,
  doUpdateSearch
} from "../redux/actions/movieActions";
import { doUnSetError } from "../redux/actions/notificationActions";
import {
  getClientNotifications,
  getMovies,
  getRatings,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
import poster from "../assets/no-poster.jpg";
import AppBarContainer from "./AppBarContainer";
import LoadingIndicator from "../components/LoadingIndicator";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
import withInfiniteScroll from "../HOC/withInfiniteScroll";
// material-ui
import Fade from "@material-ui/core/Fade";
import Grid from "@material-ui/core/Grid";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import Snackbar from "@material-ui/core/Snackbar";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    justify: "space-around",
    alignItems: "center",
    marginTop: theme.spacing.unit * 2,
    margin: theme.spacing.unit * 6
  },
  snack: {
    color: "white",
    backgroundColor: theme.palette.primary.dark
  },
  tile: {
    height: "0",
    paddingTop: "56.25%"
  }
});

class MoviesContainer extends Component {
  state = {
    open: false,
    vertical: "bottom",
    horizontal: "left"
  };

  // integrates browser navigation with url
  componentDidUpdate(prevProps) {
    /* capturing the first parameter after ms/movies as the query type and then everything that follows as the query tag - /ms/movies/(query type)/(query tag) */
    const match = `${this.props.match.url}`.match(
      /((^\/\w+\/\w+)\/(\w+)\/(.+))/
    );

    if (
      prevProps.match.url !== this.props.match.url &&
      this.props.match.url !== "/ms/movies/multi/genre"
    ) {
      let payload = {
        type: match[3],
        page: 1,
        tag: match[4]
      };

      if (match[3] === "discover") {
        this.props.doUpdateGenre(payload);
        this.props.doMoviesRequesting(payload);
      }
      if (match[3] === "multi") {
        this.props.doUpdateGenre(payload);
        this.props.doMovieCategoryRequesting(payload);
      }

      if (match[3] === "search") {
        this.props.doUpdateSearch(payload);
        this.props.doMovieSearchRequesting(payload);
      }
    }
  }

  handleClick = state => () => {
    this.setState({ open: true, ...state });
  };

  handleClose = event => {
    this.setState({ open: false });
  };

  render() {
    const { classes, width, clientNotifications, movieErrors } = this.props;
    const { vertical, horizontal, open } = this.state;
    //Provides breakpoints for number of movies per row according to screen size
    const columns = {
      xs: 2,
      sm: 3,
      md: 4,
      lg: 6,
      xl: 8
    };

    let resize = 1;
    let length = this.props.movies.results.length;
    if (length < 3 && columns[width] >= 3) {
      switch (length) {
        case 1:
        case 2:
          resize = 3;
          break;
      }
    }

    let card = 0;
    let movies = this.props.movies.results.map(index => {
      let movie = this.props.movies.list[index];

      let imageUrl = movie.poster_path
        ? "https://image.tmdb.org/t/p/w500" + movie.poster_path
        : movie.profile_path
        ? "https://image.tmdb.org/t/p/w500" + movie.profile_path
        : `${poster}`;
      card += 1;
      return (
        <GridListTile className={classes.tile} key={card} cols={resize}>
          <MovieCard
            key={card}
            movie={movie}
            imageUrl={imageUrl}
            errors={movieErrors}
          />
        </GridListTile>
      );
    });

    return (
      <>
        <AppBarContainer />
        <div className={classes.root}>
          <LoadingIndicator>{this.props.movies}</LoadingIndicator>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
        <Snackbar
          className={classes.snack}
          anchorOrigin={{ vertical, horizontal }}
          autoHideDuration={3000}
          open={clientNotifications.display}
          onClose={this.props.doUnSetError}
          ContentProps={{
            "aria-describedby": "message-id",
            className: classes.snack
          }}
          TransitionComponent={Fade}
          message={<span id="message-id">{clientNotifications.message}</span>}
        />
        <Notifications>{movieErrors}</Notifications>
        <Notifications>{this.props.playlists.notifications}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  clientNotifications: getClientNotifications(state),
  movies: getMovies(state),
  playlists: state.playlists,
  ratings: getRatings(state),
  movieErrors: getMoviesAsErrors(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    {
      doMoviesRequesting,
      doMovieCategoryRequesting,
      doMovieSearchRequesting,
      doUpdateGenre,
      doUpdateSearch,
      doRatingAdd,
      doUnSetError,
      dispatch: reset("search")
    }
  )(withWidth()(withStyles(styles)(withInfiniteScroll(MoviesContainer))))
);
