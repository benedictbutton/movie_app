import { takeEvery, all } from "redux-saga/effects";
import {
  SIGNUP_FORM,
  FETCH_USER,
  SIGNIN_FORM,
  FETCH_MOVIES
} from "../constants/actionTypes";
import { handleFetchSignUp } from "./signup";
import { handleFetchUser } from "./user";
import { handleFetchSignIn } from "./signin";
import { handleFetchMovies } from "./movies";

function *watchAll() {
  yield all([
    takeEvery(SIGNUP_FORM, handleFetchSignUp),
    takeEvery(FETCH_USER, handleFetchUser),
    takeEvery(SIGNIN_FORM, handleFetchSignIn),
    takeEvery(FETCH_MOVIES, handleFetchMovies)
  ]);
}

export default watchAll;
