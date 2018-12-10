import { combineReducers } from "redux";
import { reducer as formReducer } from "redux-form";
import clientReducer from "./client";
import userReducer from "./user";
import moviesReducer from "./movies";

const rootReducer = combineReducers({
  client: clientReducer,
  user: userReducer,
  form: formReducer,
  movies: moviesReducer
});

export default rootReducer;
