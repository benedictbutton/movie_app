import { call, put } from "redux-saga/effects";
import { MOVIES_SUCCESS, MOVIES_ERROR } from "../constants/actionTypes";
import { fetchMovies } from "../api/movies";

function* handleFetchMovies(action) {
  const { responseJson, error } = yield call(fetchMovies, action);
  if (responseJson) yield put({ type: MOVIES_SUCCESS, responseJson });
  else yield put({ type: MOVIES_ERROR, error });
}

export { handleFetchMovies };
