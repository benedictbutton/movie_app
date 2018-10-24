import { takeEvery, all } from "redux-saga/effects";
import { SIGNUP_FORM } from "../constants/actionTypes";
import { handleFetchSignUp } from "./signup";

function *watchAll() {
  yield all([takeEvery(SIGNUP_FORM, handleFetchSignUp)]);
}

export default watchAll;
