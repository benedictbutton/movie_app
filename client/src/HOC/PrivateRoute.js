import React from "react";
import { Route, Redirect } from "react-router-dom";
import { connect } from "react-redux";
import { doSignOut } from "../redux/actions/formActions";
import {
  getMoviesAsErrors,
  getPlaylistErrors
} from "../redux/selectors/selectors";
import Notifications from "../components/Notifications";

const PrivateRoute = ({ component: Component, ...rest }) => {
  // TD: create an error/notifications reducer to reduce all this duplication
  let error =
    rest.userError.code === 4011 ||
    rest.playlistError.code === 4011 ||
    rest.movieError.code === 4011 ||
    rest.ratingError.code === 4011 ||
    rest.client.successful === false
      ? true
      : false;

  if (error) rest.doSignOut();

  return (
    <Route
      {...rest}
      render={props =>
        !error ? (
          <Component {...props} />
        ) : (
          <Redirect
            to={{
              pathname: "/",
              state: { notifications: props.notifications }
            }}
          />
        )
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
  { doSignOut }
)(PrivateRoute);
