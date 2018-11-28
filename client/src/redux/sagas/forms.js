import { call, put } from "redux-saga/effects";
import { doShowUser } from "../actions/userActions";
import { postSignUpForm, postSignInForm } from "../api/forms";

function* handleFetchSignUp(payload) {
  const { values } = payload;
  const result = yield call(postSignUpForm, values);
  yield put(doShowUser(result));
}

function* handleFetchSignIn(payload) {
  const { values } = payload;
  const result = yield call(postSignInForm, values);
  yield put(doShowUser(result));
}

export { handleFetchSignUp, handleFetchSignIn };
