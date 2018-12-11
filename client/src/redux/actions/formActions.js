import {
  SIGNUP_REQUESTING,
  SIGNIN_REQUESTING,
  SIGN_OUT,
  DISPLAY_TOGGLE
} from "../constants/actionTypes";

const doSignUpRequesting = values => ({
  type: SIGNUP_REQUESTING,
  values
});

const doSignInRequesting = values => ({
  type: SIGNIN_REQUESTING,
  values
});

const doSignOut = value => ({
  type: SIGN_OUT
});

const doToggleDisplay = () => ({
  type: DISPLAY_TOGGLE
});

export { doSignUpRequesting, doSignInRequesting, doSignOut, doToggleDisplay };
