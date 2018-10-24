import { SHOW_USER } from "../constants/actionTypes";

const doShowUser = user => ({
  type: SHOW_USER,
  payload: user
});

export { doShowUser };
