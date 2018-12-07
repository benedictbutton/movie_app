import {
  USER_REQUESTING,
  SET_USER,
  UNSET_USER
} from "../constants/actionTypes";

const doUserRequesting = values => ({
  type: USER_REQUESTING,
  values
});

const doSetUser = user => ({
  type: SET_USER,
  user
});

const doUnsetUser = id => ({
  type: UNSET_USER,
  id
});

export { doUserRequesting, doSetUser, doUnsetUser };
