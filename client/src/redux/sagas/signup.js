import { call, put } from "redux-saga/effects";
import { doShowUser } from "../actions/userActions";
import { postSignUpForm } from "../api/form";

function* handleFetchSignUp(payload) {
  const { values } = payload;
  const result = yield call(postSignUpForm, values);
  yield put(doShowUser(result));
}

// function* loginSaga() {
//   const { payload: { email, password } } = yield take(LOGINFORM_SUBMIT);
//   // check if the user/pass are correct
//   // ....
//   if (success) {
//     yield put(LOGINFORM_SUCCESS);

export { handleFetchSignUp };
