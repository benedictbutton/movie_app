import { SHOW_USER, FETCH_USER } from "../constants/actionTypes";

const doShowUser = user => ({
  type: SHOW_USER,
  user
});

const getUser = id => ({
  type: FETCH_USER,
  id
});

export { doShowUser, getUser };
