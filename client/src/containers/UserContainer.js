import React, { Component } from "react";
import { withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doShowUser, getUser } from "../redux/actions/userActions";
import User from "../components/User";
//
class UserContainer extends Component {
  constructor(props) {
    super(props);
  }

  // componentDidMount() {
  // console.log(this.state.user);
  // }
  //
  // componentDidUpdate(prevProps) {
  //   if (this.props.user.id !== prevProps.user.id) {
  //     this.fetchUser(this.props.user.id);
  //   }
  // }

  render() {
    return <User {...this.props} />;
  }
}

const mapStateToProps = (state, props) => ({
  user: state.user
});

// const mapDispatchToProps = dispatch => ({
//   getUser: () => dispatch(getUser)
// });
//
// export default UserContainer;

export default withRouter(
  connect(
    mapStateToProps,
    { getUser: getUser }
  )(UserContainer)
);
