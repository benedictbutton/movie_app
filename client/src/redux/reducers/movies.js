import { schema, normalize } from "normalizr";
import { SHOW_MOVIES } from "../constants/actionTypes";

const INITIAL_STATE = {};

const applyShowMovies = (state, action) => {
  return { ...state, ...action.payload.entities.movies };
};

function moviesReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case SHOW_MOVIES: {
      return applyShowMovies(state, action);
    }
    default:
      return state;
  }
}

export default moviesReducer;
