import { SHOW_USER } from "../constants/actionTypes";

const INITIAL_STATE = {
  id: null,
  firstName: "",
  lastName: "",
  email: "",
  password: ""
};

const applyShowUser = (state, action) => {
  return { ...state, id: action.user.id };
};

function userReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case SHOW_USER: {
      return applyShowUser(state, action);
    }
    default:
      return state;
  }
}

export default userReducer;
