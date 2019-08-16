import {
  USER_REQUESTING,
  USER_SUCCESS,
  USER_ERROR,
  TOGGLE_DISPLAY
} from "../constants/actionTypes";

const INITIAL_STATE = {
  profile: {
    id: null,
    firstName: null,
    lastName: null,
    username: "",
    email: ""
  },
  requesting: false,
  successful: false,
  notifications: {}
};

const applyUserRequest = (state, action) => {
  return {
    ...state,
    requesting: true
  };
};

const applyUserSuccess = (state, action) => ({
  ...state,
  profile: {
    id: action.responseJson.id,
    firstName: action.responseJson.first_name,
    lastName: action.responseJson.last_name,
    username: action.responseJson.username,
    email: action.responseJson.email
  },
  requesting: false,
  successful: true
});

const applyUserError = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: action.error,
    message: `${action.error.message}` || "something went wrong",
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

function userReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case USER_REQUESTING:
      return applyUserRequest(state, action);
    case USER_SUCCESS:
      return applyUserSuccess(state, action);
    case USER_ERROR:
      return applyUserError(state, action);
    case TOGGLE_DISPLAY:
      return applyToggleDisplay(state);

    default:
      return state;
  }
}

export default userReducer;
