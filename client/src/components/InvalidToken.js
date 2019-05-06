import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doUnsetUser } from "../redux/actions/userActions";
import { doSignOut } from "../redux/actions/formActions";
import { doPlaylistsRemove } from "../redux/actions/playlistActions";
import { doRatingsRemove } from "../redux/actions/ratingActions";

class InvalidToken extends Component {
  handleLogOut = () => {
    sessionStorage.removeItem("jwt");
    localStorage.removeItem("state");
    this.props.doUnsetUser();
    this.props.doSignOut();
    this.props.doRatingsRemove();
    this.props.doPlaylistsRemove();
  };

  render() {
    if (
      this.props.userErrors.code === 4011 ||
      this.props.client.successful === false
    ) {
      this.handleLogOut();
      return <Redirect to="/" />;
    }
    return null;
  }
}

const mapStateToProps = state => ({
  userErrors: state.user.notifications,
  client: state.client
});

export default withRouter(connect(mapStateToProps)(InvalidToken));
