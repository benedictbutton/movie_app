import {
  SIGNUP_REQUESTING,
  SIGNUP_SUCCESS,
  SIGNUP_ERROR,
  SIGNIN_REQUESTING,
  SIGNIN_SUCCESS,
  SIGNIN_ERROR,
  RESET_REQUESTING,
  RESET_SUCCESS,
  RESET_ERROR,
  TOGGLE_DISPLAY
} from "../constants/actionTypes";

const INITIAL_STATE = {
  requesting: false,
  successful: false,
  reset: false,
  notifications: {}
};

const applySignUpRequest = (state, action) => ({
  ...state,
  requesting: true
});

const applySignUpSuccess = (state, action) => ({
  ...state,
  requesting: false,
  successful: true,
  notifications: {
    ...state.notifications,
    body: null,
    message: "SignUp Successful. Enjoy :-)",
    code: 200,
    display: true
  }
});

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
    message: "Welcome back!",
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

const applyResetRequesting = (state, action) => ({
  ...state,
  requesting: true
});

const applyResetSuccess = (state, action) => ({
  ...state,
  requesting: false,
  successful: false,
  reset: true,
  notifications: {
    ...state.notifications,
    body: null,
    message: "Password Successfully Changed",
    code: 202,
    display: true
  }
});

const applyResetError = (state, action) => ({
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
    case RESET_REQUESTING:
      return applyResetRequesting(state, action);
    case RESET_SUCCESS:
      return applyResetSuccess(state, action);
    case RESET_ERROR:
      return applyResetError(state, action);
    case TOGGLE_DISPLAY:
      return applyToggleDisplay(state);

    default:
      return state;
  }
}

export default clientReducer;
