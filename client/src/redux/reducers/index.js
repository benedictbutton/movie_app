import { combineReducers } from "redux";
import { reducer as formReducer } from "redux-form";
import clientReducer from "./client";
import userReducer from "./user";
import moviesReducer from "./movies";
import playlistsReducer from "./playlists";
import ratingsReducer from "./ratings";

const appReducer = combineReducers({
  client: clientReducer,
  user: userReducer,
  form: formReducer,
  movies: moviesReducer,
  playlists: playlistsReducer,
  ratings: ratingsReducer
});

const rootReducer = (state, action) => {
  if (action.type === "SIGN_OUT") {
    sessionStorage.removeItem("jwt");
    localStorage.removeItem("state");
    state = undefined;
  }
  return appReducer(state, action);
};

export default rootReducer;
