import React from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
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
