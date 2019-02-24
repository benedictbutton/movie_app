import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doSignOut } from "../redux/actions/formActions";
import { doUserRequesting } from "../redux/actions/userActions";
import { getUser } from "../redux/selectors/selectors";
import Notifications from "../components/Notifications";
import User from "../components/User";

class UserContainer extends Component {
  componentDidMount() {
    this.props.dispatch(doUserRequesting());
  }

  render() {
    const { user } = this.props;

    return (
      <>
        <User {...this.props} />
        <Notifications>{user.notifications}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  user: getUser(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(UserContainer)
);
