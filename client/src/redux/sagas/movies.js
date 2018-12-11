import { call, put } from "redux-saga/effects";
import { MOVIES_SUCCESS, MOVIES_ERROR } from "../constants/actionTypes";
import { fetchMovies } from "../api/movies";

function* handleFetchMovies(action) {
  const { responseJson, error } = yield call(fetchMovies, action);
  if (responseJson) {
    yield put({ type: MOVIES_SUCCESS, responseJson });
    action.payload.push("/ms/movies");
  } else {
    yield put({ type: MOVIES_ERROR, error });
    action.payload.push("/ms/sign-in");
  }
}

export { handleFetchMovies };
