import { call, put } from "redux-saga/effects";
import { doShowMovies } from "../actions/movieActions";
import { fetchMovies } from "../api/movies";

function* handleFetchMovies(query) {
  const result = yield call(fetchMovies, query);
  yield put(doShowMovies(result));
}

export { handleFetchMovies };
