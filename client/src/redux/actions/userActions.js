import { SHOW_USER } from "../constants/actionTypes";

const doShowUser = user => ({
  type: SHOW_USER,
  user
});

export { doShowUser };
