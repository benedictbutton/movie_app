import { takeEvery, takeLatest, all } from "redux-saga/effects";
import {
  SIGNUP_REQUESTING,
  SIGNIN_REQUESTING,
  USER_REQUESTING,
  FETCH_MOVIES
} from "../constants/actionTypes";
import { handleFetchSignUp, handleFetchSignIn } from "./forms";
import { handleFetchUser } from "./user";
import { handleFetchMovies } from "./movies";

function *watchAll() {
  yield all([
    takeLatest(SIGNUP_REQUESTING, handleFetchSignUp),
    takeLatest(SIGNIN_REQUESTING, handleFetchSignIn),
    takeLatest(USER_REQUESTING, handleFetchUser),
    takeEvery(FETCH_MOVIES, handleFetchMovies)
  ]);
}

export default watchAll;
