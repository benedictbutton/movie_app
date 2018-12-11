import React, { Component } from "react";
import { connect } from "react-redux";
import { withRouter } from "react-router-dom";
import Movie from "../components/Movie";

const MovieContainer = props => {
  return <Movie movie={props.location.state} />;
};

// function getTheMovie(state) {
//   debugger;
//   let title;
//   const movie = state.map(el => {
//     title = el.title;
//     return title;
//   });
//   return movie;
// }

const mapStateToProps = (state, props) => {
  const id = props.match.params.id;
  return { movies: state.movies };
};

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(MovieContainer)
);
