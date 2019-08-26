import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doSignOut } from "../redux/actions/formActions";
import LogOut from "../components/LogOut";
//material-ui
import Divider from "@material-ui/core/Divider";

class LogOutContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      toMovies: false
    };
    this.handleLogOut = this.handleLogOut.bind(this);
  }

  handleLogOut(event) {
    this.props.doSignOut();
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

export default withRouter(
  connect(
    null,
    { doSignOut }
  )(LogOutContainer)
);
