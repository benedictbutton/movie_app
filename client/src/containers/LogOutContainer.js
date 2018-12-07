import React, { Component } from "react";
import { connect } from "react-redux";
import { doUnsetUser } from "../redux/actions/userActions";
import { doSignOut } from "../redux/actions/formActions";
import { Redirect, withRouter } from "react-router-dom";
import LogOut from "../components/LogOut";
//material-ui
import Divider from "@material-ui/core/Divider";
import ListItemText from "@material-ui/core/ListItemText";

class LogOutContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      toMovies: false
    };
    this.handleLogOut = this.handleLogOut.bind(this);
  }

  handleLogOut(event) {
    event.preventDefault();
    sessionStorage.removeItem("jwt");
    localStorage.removeItem("state");
    this.props.doUnsetUser();
    this.props.doSignOut();
    this.setState(() => ({ toMovies: true }));
  }

  render() {
    if (this.state.toMovies) {
      return <Redirect to="/" />;
    }
    return (
      <>
        <Divider />
        <LogOut logout={this.handleLogOut} />
      </>
    );
  }
}

export default withRouter(
  connect(
    null,
    { doUnsetUser, doSignOut }
  )(LogOutContainer)
);
