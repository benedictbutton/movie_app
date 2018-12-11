import {
  SIGNUP_REQUESTING,
  SIGNUP_SUCCESS,
  SIGNUP_ERROR,
  SIGNIN_REQUESTING,
  SIGNIN_SUCCESS,
  SIGNIN_ERROR,
  SIGN_OUT,
  DISPLAY_TOGGLE
} from "../constants/actionTypes";

const INITIAL_STATE = {
  requesting: false,
  successful: false,
  messages: "",
  errors: [],
  display: false
};

const applySignUpRequest = (state, action) => ({
  ...state,
  requesting: true
});

const applySignUpSuccess = (state, action) => {
  return {
    ...state,
    requesting: false,
    successful: true,
    messages: "Welcome & Enjoy :-)",
    display: true
  };
};

const applySignUpError = (state, action) => ({
  ...state,
  errors: [
    ...state.errors,
    {
      body: action.error,
      time: new Date()
    }
  ],
  messages: action.error.message,
  requesting: false,
  successful: false,
  display: true
});

const applySignInRequest = (state, action) => ({
  ...state,
  requesting: true
});

const applySignInSuccess = (state, action) => ({
  ...state,
  requesting: false,
  successful: true,
  messages: "Welcome Back :-)",
  display: true
});

const applySignInError = (state, action) => ({
  ...state,
  errors: [
    ...state.errors,
    {
      body: action.error,
      time: new Date()
    }
  ],
  messages: "Woops. Sorry, not quite. Have another try.",
  requesting: false,
  successful: false,
  display: true
});

const applyToggleDisplay = (state, action) => ({
  ...state,
  display: false
});

function clientReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case SIGNUP_REQUESTING:
      return applySignUpRequest(state, action);
    case SIGNUP_SUCCESS:
      return applySignUpSuccess(state, action);
    case SIGNUP_ERROR:
      return applySignUpError(state, action);
    case SIGNIN_REQUESTING:
      return applySignInRequest(state, action);
    case SIGNIN_SUCCESS:
      return applySignInSuccess(state, action);
    case SIGNIN_ERROR:
      return applySignInError(state, action);
    case SIGN_OUT:
      return INITIAL_STATE;
    case DISPLAY_TOGGLE:
      return applyToggleDisplay(state);

    default:
      return state;
  }
}

export default clientReducer;
