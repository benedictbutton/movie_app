import { SHOW_MOVIES, FETCH_MOVIES } from "../constants/actionTypes";

const doShowMovies = movies => ({
  type: SHOW_MOVIES,
  payload: movies.results
});

const getMovies = movies => ({
  type: FETCH_MOVIES,
  movies
});

export { doShowMovies, getMovies };
