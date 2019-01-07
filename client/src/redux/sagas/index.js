import { takeEvery, takeLatest, all } from "redux-saga/effects";
import {
  SIGNUP_REQUESTING,
  SIGNIN_REQUESTING,
  USER_REQUESTING,
  MOVIES_REQUESTING,
  MOVIE_POSTING
} from "../constants/actionTypes";
import { handleFetchSignUp, handleFetchSignIn } from "./forms";
import { handleFetchUser } from "./user";
import { handleFetchMovies, handlePostMovie } from "./movies";

function* watchAll() {
  yield all([
    takeLatest(SIGNUP_REQUESTING, handleFetchSignUp),
    takeEvery(SIGNIN_REQUESTING, handleFetchSignIn),
    takeLatest(USER_REQUESTING, handleFetchUser),
    takeLatest(MOVIES_REQUESTING, handleFetchMovies),
    takeLatest(MOVIE_POSTING, handlePostMovie)
  ]);
}

// function* watchSignIn() {
//   while (true) {
//     const action = yield take(SIGNIN_REQUESTING);
//     console.log(action);
//
//     const task = yield fork(handleFetchSignIn, action);
//     console.log(task);
//     const newAction = yield take(RATINGS_REQUESTING);
//     console.log(newAction);
//   }
// }

export default watchAll;
