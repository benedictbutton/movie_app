import { SHOW_USER } from "../constants/actionTypes";

const INITIAL_STATE = {};

const applyShowUser = (state, action) => {
  return {
    ...state,
    id: action.user.id,
    firstName: action.user.first_name,
    lastName: action.user.last_name,
    email: action.user.email
  };
};

function userReducer(state = {}, action) {
  switch (action.type) {
    case SHOW_USER: {
      return applyShowUser(state, action);
    }
    default:
      return state;
  }
}

export default userReducer;
