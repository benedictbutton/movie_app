import React from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { getMovies } from "../redux/selectors/selectors";
import Movie from "../components/Movie";

const MovieContainer = props => {
  return <Movie movie={props.location.state} />;
};

const mapStateToProps = state => ({
  movies: getMovies(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(MovieContainer)
);
