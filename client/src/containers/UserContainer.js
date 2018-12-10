import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doUserRequesting } from "../redux/actions/userActions";
import User from "../components/User";

class UserContainer extends Component {
  componentDidMount() {
    const { history } = this.props;
    this.props.dispatch(doUserRequesting(history));
  }

  render() {
    return <User {...this.props} />;
  }
}

const mapStateToProps = (state, props) => ({
  client: state.client,
  user: state.user
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(UserContainer)
);
