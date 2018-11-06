import { combineReducers } from "redux";
import { reducer as formReducer } from "redux-form";
import userReducer from "./user";
import moviesReducer from "./movies";

const rootReducer = combineReducers({
  user: userReducer,
  form: formReducer,
  movies: moviesReducer
});

export default rootReducer;
