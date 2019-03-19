import { call, put } from "redux-saga/effects";
import {
  MOVIES_SUCCESS,
  MY_MOVIES_SUCCESS,
  MOVIE_CATEGORY_SUCCESS,
  MOVIE_SEARCH_SUCCESS,
  MOVIE_SUCCESS,
  MOVIES_ERROR
} from "../constants/actionTypes";
import {
  fetchMovies,
  fetchMyMovies,
  fetchSearch,
  fetchCategory,
  postMovie
} from "../api/movies";

function* handleFetchMovies(action) {
  const { payload } = action;
  const { responseJson, error } = yield call(fetchMovies, payload);
  if (responseJson) yield put({ type: MOVIES_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

function* handleFetchMyMovies() {
  const { responseJson, error } = yield call(fetchMyMovies);
  if (responseJson) yield put({ type: MY_MOVIES_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

function* handleFetchSearch(payload) {
  const { responseJson, error } = yield call(fetchSearch, payload);
  if (responseJson) yield put({ type: MOVIE_SEARCH_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

function* handleFetchCategory(query) {
  const payload = query.query;
  const { responseJson, error } = yield call(fetchCategory, payload);
  if (responseJson) yield put({ type: MOVIE_CATEGORY_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

function* handlePostMovie(payload) {
  const { movie } = payload;
  movie.score = parseInt(payload.score, 10) + 1;
  const { responseJson, error } = yield call(postMovie, movie);
  /*MOVIE_SUCCESS is not triggering a reducer; it's simply indicating in the console that the POST request was successful*/
  if (responseJson) yield put({ type: MOVIE_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

export {
  handleFetchMovies,
  handleFetchMyMovies,
  handleFetchSearch,
  handleFetchCategory,
  handlePostMovie
};
