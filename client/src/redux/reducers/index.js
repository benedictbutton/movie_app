import { combineReducers } from "redux";
import { connectRouter } from "connected-react-router";
import { reducer as formReducer } from "redux-form";
import clientReducer from "./client";
import userReducer from "./user";
import moviesReducer from "./movies";

const rootReducer = history =>
  combineReducers({
    router: connectRouter(history),
    client: clientReducer,
    user: userReducer,
    form: formReducer,
    movies: moviesReducer
  });

export default rootReducer;
