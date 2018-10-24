import { SIGNUP_FORM } from "../constants/actionTypes";

const doSignUpForm = values => ({
  type: SIGNUP_FORM,
  values
});

export { doSignUpForm };
