import { MOVIES_REQUESTING, MOVIE_POSTING } from "../constants/actionTypes";

const doMoviesRequesting = movies => ({
  type: MOVIES_REQUESTING,
  payload: movies
});

const doMoviePosting = movie => ({
  type: MOVIE_POSTING,
  payload: movie
});

export { doMoviesRequesting, doMoviePosting };
