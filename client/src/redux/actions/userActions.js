import { USER_REQUESTING } from "../constants/actionTypes";

const doUserRequesting = values => ({
  type: USER_REQUESTING,
  values
});

export { doUserRequesting };
