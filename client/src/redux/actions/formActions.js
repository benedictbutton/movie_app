import {
  SIGNUP_REQUESTING,
  SIGNIN_REQUESTING,
  RESET_REQUESTING,
  RESET_ERROR,
  SIGN_OUT
} from "../constants/actionTypes";

const doSignUpRequesting = values => ({
  type: SIGNUP_REQUESTING,
  values
});

const doSignInRequesting = values => ({
  type: SIGNIN_REQUESTING,
  values
});

const doResetRequesting = values => ({
  type: RESET_REQUESTING,
  values
});

const doResetError = error => ({
  type: RESET_ERROR,
  error
});

const doSignOut = () => ({
  type: SIGN_OUT
});

export {
  doSignUpRequesting,
  doSignInRequesting,
  doResetRequesting,
  doResetError,
  doSignOut
};
