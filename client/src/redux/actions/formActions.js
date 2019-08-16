import {
  SIGNUP_REQUESTING,
  SIGNIN_REQUESTING,
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

const doSignOut = () => ({
  type: SIGN_OUT
});

export { doSignUpRequesting, doSignInRequesting, doSignOut };
