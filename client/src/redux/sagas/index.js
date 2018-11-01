import { takeEvery, all } from "redux-saga/effects";
import { SIGNUP_FORM, FETCH_USER } from "../constants/actionTypes";
import { handleFetchSignUp } from "./signup";
import { handleFetchUser } from "./user";

function *watchAll() {
  yield all([
    takeEvery(SIGNUP_FORM, handleFetchSignUp),
    takeEvery(FETCH_USER, handleFetchUser)
  ]);
}

export default watchAll;
