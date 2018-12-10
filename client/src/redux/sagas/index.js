import { take, fork, takeEvery, takeLatest, all } from "redux-saga/effects";
import {
  SIGNUP_REQUESTING,
  SIGNIN_REQUESTING,
  USER_REQUESTING,
  MOVIES_REQUESTING
} from "../constants/actionTypes";
import { handleFetchSignUp, handleFetchSignIn } from "./forms";
import { handleFetchUser } from "./user";
import { handleFetchMovies } from "./movies";

function *watchAll() {
  yield all([
    takeLatest(SIGNUP_REQUESTING, handleFetchSignUp),
    takeLatest(SIGNIN_REQUESTING, handleFetchSignIn),
    takeLatest(USER_REQUESTING, handleFetchUser),
    takeLatest(MOVIES_REQUESTING, handleFetchMovies)
  ]);
}

export default watchAll;
