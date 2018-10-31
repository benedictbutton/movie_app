import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doShowUser, getUser } from "../redux/actions/userActions";
import User from "../components/User";
//
const UserContainer = props => {
  return <User {...props} />;
};

const mapStateToProps = (state, props) => ({
  user: state.user
});

export default withRouter(
  connect(
    mapStateToProps,
    undefined
  )(UserContainer)
);
