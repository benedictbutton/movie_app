import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reset } from "redux-form";
import { doRatingAdd } from "../redux/actions/ratingActions";
import {
  doMoviesRequesting,
  doMovieCategoryRequesting,
  doMovieSearchRequesting
} from "../redux/actions/movieActions";
import {
  getClientNotifications,
  getMovies,
  getRatings,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
import poster from "../assets/no-poster.jpg";
import AppBarContainer from "./AppBarContainer";
import MovieCard from "../components/MovieCard";
import Notifications from "../components/Notifications";
// material-ui
import Grid from "@material-ui/core/Grid";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
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
  tile: {
    height: "0",
    paddingTop: "56.25%"
  }
});

class MoviesContainer extends Component {
  componentDidMount() {
    window.addEventListener("scroll", this.onScroll, false);
    this.props.movies.query.type === "discover"
      ? this.props.doMoviesRequesting(this.props.movies.query)
      : this.props.doMovieCategoryRequesting(this.props.movies.query);
  }

  componentWillUnmount() {
    window.removeEventListener("scroll", this.onScroll, false);
  }

  onScroll = () => {
    if (
      window.innerHeight + window.scrollY >= document.body.offsetHeight - 500 &&
      this.props.movies.results.length &&
      !this.props.movies.requesting &&
      this.props.movies.query.type !== "search"
    ) {
      let payload = {
        type: this.props.movies.query.type,
        page: this.props.movies.query.page + 1,
        tag: this.props.movies.query.tag
      };
      this.props.movies.query.type === "discover"
        ? this.props.doMoviesRequesting(payload)
        : this.props.doMovieCategoryRequesting(payload);
    }
  };

  render() {
    const { classes, width, clientNotifications, movieErrors } = this.props;
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
          <MovieCard key={card} movie={movie} imageUrl={imageUrl} />
        </GridListTile>
      );
    });

    return (
      <>
        <AppBarContainer />
        <div className={classes.root}>
          <GridList cellHeight="auto" spacing={10} cols={columns[width]}>
            {movies}
          </GridList>
        </div>
        <Notifications>{movieErrors}</Notifications>
        <Notifications>{clientNotifications}</Notifications>
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
      doRatingAdd,
      dispatch: reset("search")
    }
  )(withWidth()(withStyles(styles)(MoviesContainer)))
);
