import React from "react";
import { connect } from "react-redux";
import { doShowUser } from "../redux/actions/userActions";

const User = ({ user }) => {
  const { firstName } = user;

  return <h1>{firstName}</h1>;
};

export default User;
