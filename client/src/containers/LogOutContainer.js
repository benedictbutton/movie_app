import React, { Component } from "react";
import { connect } from "react-redux";
import { Redirect, withRouter } from "react-router-dom";
import LogOut from "../components/LogOut";
//material-ui
import Divider from "@material-ui/core/Divider";
import ListItemText from "@material-ui/core/ListItemText";

class LogOutContainer extends Component {
  constructor(props) {
    super(props);
    this.handleLogOut = this.handleLogOut.bind(this);
  }

  handleLogOut(event) {
    event.preventDefault();
    sessionStorage.removeItem("jwt");
    localStorage.removeItem("state");
    return <Redirect to="/ms/movies" />;
  }

  render() {
    return (
      <>
        <Divider />
        <LogOut logout={this.handleLogOut} />
      </>
    );
  }
}

export default LogOutContainer;
