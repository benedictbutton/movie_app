import { USER_REQUESTING, UNSET_USER } from "../constants/actionTypes";

const doUserRequesting = values => ({
  type: USER_REQUESTING,
  values
});

const doUnsetUser = id => ({
  type: UNSET_USER,
  id
});

export { doUserRequesting, doUnsetUser };
