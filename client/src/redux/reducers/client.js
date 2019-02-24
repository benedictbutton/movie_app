import {
  SIGNUP_REQUESTING,
  SIGNUP_SUCCESS,
  SIGNUP_ERROR,
  SIGNIN_REQUESTING,
  SIGNIN_SUCCESS,
  SIGNIN_ERROR,
  SIGN_OUT,
  TOGGLE_DISPLAY
} from "../constants/actionTypes";

const INITIAL_STATE = {
  requesting: false,
  successful: false,
  notifications: {}
};

const applySignUpRequest = (state, action) => ({
  ...state,
  requesting: true
});

const applySignUpSuccess = (state, action) => {
  return {
    ...state,
    requesting: false,
    successful: true
  };
};

const applySignUpError = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: action.error,
    message: `${action.error.message}`,
    code: action.error.code,
    display: true
  },
  requesting: false,
  successful: false
});

const applySignInRequest = (state, action) => ({
  ...state,
  requesting: true
});

const applySignInSuccess = (state, action) => ({
  ...state,
  requesting: false,
  successful: true,
  notifications: {
    ...state.notifications,
    body: null,
    message: "Welcome back :-)",
    code: 200,
    display: true
  }
});

const applySignInError = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: action.error,
    message: `${action.error.message}`,
    code: action.error.code,
    display: true
  },
  requesting: false,
  successful: false
});

const applySignOut = () => {
  window.localStorage.clear();

  return INITIAL_STATE;
};

const applyToggleDisplay = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: "",
    message: "",
    code: null,
    display: false
  }
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
      return applySignOut();
    case TOGGLE_DISPLAY:
      return applyToggleDisplay(state);

    default:
      return state;
  }
}

export default clientReducer;
