import React from "react";
import { Route, Redirect } from "react-router-dom";
import { connect } from "react-redux";
import { doResetError, doSignOut } from "../redux/actions/formActions";
import {
  getMoviesAsErrors,
  getPlaylistErrors
} from "../redux/selectors/selectors";

const PrivateRoute = ({ component: Component, ...rest }) => {
  // TD: create an error/notifications reducer to reduce all this duplication
  let tokenError =
    rest.userError.code === 4011 ||
    rest.playlistError.code === 4011 ||
    rest.movieError.code === 4011 ||
    rest.ratingError.code === 4011
      ? true
      : false;

  let error = tokenError || rest.client.successful === false ? true : false;
  //
  if (error) {
    rest.doSignOut();
    if (tokenError)
      rest.doResetError({
        message: "Invalid or expired token. Please sign-in again.",
        code: null
      });
  }

  return (
    <Route
      {...rest}
      render={props =>
        !error ? <Component {...props} /> : <Redirect to="/" />
      }
    />
  );
};

const mapStateToProps = state => ({
  userError: state.user.notifications,
  movieError: getMoviesAsErrors(state),
  playlistError: getPlaylistErrors(state),
  ratingError: state.ratings.notifications,
  client: state.client
});

export default connect(
  mapStateToProps,
  { doResetError, doSignOut }
)(PrivateRoute);
