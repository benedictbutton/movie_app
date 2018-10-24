import { SHOW_USER } from "../constants/actionTypes";

const INITIAL_STATE = {
  firstName: "",
  lastName: "",
  email: "",
  password: ""
};

const applyShowUser = (state, action) => {
  console.log("test");
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
