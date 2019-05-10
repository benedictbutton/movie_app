import React from "react";
import { Route, Redirect } from "react-router-dom";
import { connect } from "react-redux";
import { doUnsetUser } from "../redux/actions/userActions";
import { doSignOut } from "../redux/actions/formActions";
import { doPlaylistsRemove } from "../redux/actions/playlistActions";
import { doRatingsRemove } from "../redux/actions/ratingActions";
import {
  getMoviesAsErrors,
  getPlaylistErrors
} from "../redux/selectors/selectors";
import Notifications from "../components/Notifications";

const PrivateRoute = ({ component: Component, ...rest }) => {
  // debugger;
  let error =
    rest.userError.code === 4011 ||
    rest.playlistError.code === 4011 ||
    rest.movieError.code === 4011 ||
    rest.ratingError.code === 4011 ||
    rest.client.successful === false
      ? true
      : false;

  if (error) {
    sessionStorage.removeItem("jwt");
    localStorage.removeItem("state");
    rest.doUnsetUser();
    rest.doSignOut();
    rest.doRatingsRemove();
    rest.doPlaylistsRemove();
  }

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
  { doUnsetUser, doSignOut, doRatingsRemove, doPlaylistsRemove }
)(PrivateRoute);
