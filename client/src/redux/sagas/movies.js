import { call, put } from "redux-saga/effects";
import {
  MOVIES_SUCCESS,
  MOVIES_ERROR,
  MOVIE_SUCCESS,
  MOVIE_ERROR
} from "../constants/actionTypes";
import { fetchMovies, postMovie } from "../api/movies";

function* handleFetchMovies(action) {
  const { payload } = action;
  const { responseJson, error } = yield call(fetchMovies, payload);
  if (responseJson) yield put({ type: MOVIES_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

function* handlePostMovie(payload) {
  const { movie } = payload;
  movie.score = parseInt(payload.score, 10) + 1;
  const { responseJson, error } = yield call(postMovie, movie);
  if (responseJson) yield put({ type: MOVIE_SUCCESS, responseJson });
  else yield put({ type: MOVIE_ERROR, error });
}

export { handleFetchMovies, handlePostMovie };
