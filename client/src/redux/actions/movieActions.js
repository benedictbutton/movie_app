import {
  MOVIES_REQUESTING,
  MY_MOVIES_REQUESTING,
  MOVIE_POSTING
} from "../constants/actionTypes";

const doMoviesRequesting = movies => ({
  type: MOVIES_REQUESTING,
  payload: movies
});

const doMyMoviesRequesting = movies => ({
  type: MY_MOVIES_REQUESTING,
  payload: movies
});

const doMoviePosting = (rating, movie) => ({
  type: MOVIE_POSTING,
  movie: movie,
  score: rating.currentTarget.value
});

export { doMoviesRequesting, doMyMoviesRequesting, doMoviePosting };
