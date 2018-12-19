import { combineReducers } from "redux";
import { reducer as formReducer } from "redux-form";
import clientReducer from "./client";
import userReducer from "./user";
import moviesReducer from "./movies";
import ratingsReducer from "./ratings";

const rootReducer = combineReducers({
  client: clientReducer,
  user: userReducer,
  form: formReducer,
  movies: moviesReducer,
  ratings: ratingsReducer
});

export default rootReducer;
