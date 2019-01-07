import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doUserRequesting } from "../redux/actions/userActions";
import { getClient, getUser } from "../redux/selectors/selectors";
import User from "../components/User";

class UserContainer extends Component {
  componentDidMount() {
    this.props.dispatch(doUserRequesting());
  }

  render() {
    if (!this.props.client.successful) {
      return <Redirect to="/ms/sign-in" />;
    }
    return <User {...this.props} />;
  }
}

const mapStateToProps = (state, props) => ({
  client: getClient(state),
  user: getUser(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(UserContainer)
);
