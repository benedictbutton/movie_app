import {
  USER_REQUESTING,
  USER_SUCCESS,
  USER_ERROR,
  SET_USER,
  UNSET_USER
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
  errors: [],
  messages: ""
};

const applyUserRequest = (state, action) => {
  debugger;
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
  errors: [
    ...state.errors,
    {
      body: action.error,
      time: new Date()
    }
  ],
  messages: [],
  requesting: false,
  successful: false
});

const applySetUser = (state, action) => ({
  ...state,
  id: action.responseJson.id,
  firstName: action.responseJson.first_name,
  lastName: action.responseJson.last_name,
  action: action.responseJson.username,
  email: action.responseJson.email
});

function userReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case SET_USER:
      return applySetUser(state, action);
    case UNSET_USER:
      return INITIAL_STATE;
    case USER_REQUESTING:
      return applyUserRequest(state, action);
    case USER_SUCCESS:
      return applyUserSuccess(state, action);
    case USER_ERROR:
      return applyUserError(state, action);
    default:
      return state;
  }
}

export default userReducer;
