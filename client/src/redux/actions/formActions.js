import { SIGNUP_FORM, SIGNIN_FORM } from "../constants/actionTypes";

const doSignUpForm = values => ({
  type: SIGNUP_FORM,
  values
});

const doSignInForm = values => ({
  type: SIGNIN_FORM,
  values
});

export { doSignUpForm, doSignInForm };
