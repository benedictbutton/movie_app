import { call, put } from "redux-saga/effects";
import {
  MOVIES_SUCCESS,
  MOVIES_ERROR,
  MOVIE_SUCCESS,
  MOVIE_ERROR
} from "../constants/actionTypes";
import { fetchMovies, postMovie } from "../api/movies";

function* handleFetchMovies(action) {
  const { responseJson, error } = yield call(fetchMovies, action);
  if (responseJson) yield put({ type: MOVIES_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

function* handlePostMovie(payload) {
  debugger;
  const { responseJson, error } = yield call(postMovie, payload);
  if (responseJson) yield put({ type: MOVIE_SUCCESS, responseJson });
  else yield put({ type: MOVIE_ERROR, error });
}

export { handleFetchMovies, handlePostMovie };
