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
import {
  getClientNotifications,
  getMovies,
  getRatings,
  getMoviesAsErrors
} from "../redux/selectors/selectors";
import AppBarContainer from "../containers/AppBarContainer";
import MoviesContainer from "../containers/MoviesContainer";

// const withMovies = Component => props => {
class withMovies extends Component {
  state = {
    categoryName: "",
    genreName: "",
    display: false
  };

  componentDidMount() {
    window.addEventListener("scroll", this.onScroll, false);

    if (this.props.match.params.type === "discover")
      this.props.doMoviesRequesting(this.props.match.params.query);
    if (this.props.match.params.type === "multi")
      this.props.doMovieCategoryRequesting(this.props.match.params.query);
    if (this.props.match.params.type === "search")
      this.props.doMovieSearchRequesting(this.props.match.params.query);
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

  handleChange = event => {
    this.setState({ categoryName: event.target.value });
    const payload = { type: "multi", page: 1, tag: event.target.value };
    if (event.target.value !== "genre") {
      this.setState({ display: false });
      this.props.doUpdateGenre(payload);
      this.props.doMovieCategoryRequesting(payload);
    } else this.setState({ display: true });
    this.props.history.push(`/ms/movies/${payload.tag}`);
  };

  handleGenre = event => {
    this.setState({ genreName: event.target.value });
    const payload = { type: "discover", page: 0, tag: event.target.value };
    this.props.doUpdateGenre(payload);
    this.props.doMoviesRequesting(payload);
    this.props.history.push(`/ms/movies/${payload.tag}`);
  };

  render() {
    return (
      <MoviesContainer
        movies={this.props.movies}
        movieErrors={this.props.movieErrors}
        ratings={this.props.ratings}
        playlists={this.props.playlists}
        clientNotifications={this.props.clientNotifications}
      />
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
      dispatch: reset("search")
    }
  )(withMovies)
);
