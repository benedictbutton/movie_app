import { call, put } from "redux-saga/effects";
import { doShowMovies } from "../actions/movieActions";
import { postSignInForm } from "../api/form";

function* handleFetchSignIn(payload) {
  const { values } = payload;
  const result = yield call(postSignInForm, values);
  yield put(doShowMovies(result));
}

export { handleFetchSignIn };
