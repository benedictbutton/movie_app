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
    this.state = {
      toMovies: false
    };
    this.handleLogOut = this.handleLogOut.bind(this);
  }

  handleLogOut(event) {
    event.preventDefault();
    sessionStorage.removeItem("jwt");
    localStorage.removeItem("state");
    this.setState(() => ({ toMovies: true }));
  }

  render() {
    if (this.state.toMovies) {
      return <Redirect to="/ms/movies" />;
    }
    return (
      <>
        <Divider />
        <LogOut logout={this.handleLogOut} />
      </>
    );
  }
}

export default withRouter(LogOutContainer);
