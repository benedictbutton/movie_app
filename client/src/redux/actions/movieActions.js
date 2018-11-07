import { SHOW_MOVIES, FETCH_MOVIES } from "../constants/actionTypes";

const doShowMovies = movies => ({
  type: SHOW_MOVIES,
  payload: movies
});

const getMovies = movies => ({
  type: FETCH_MOVIES,
  payload: movies
});

export { doShowMovies, getMovies };
