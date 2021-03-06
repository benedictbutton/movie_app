import { call, put, all } from "redux-saga/effects";
import {
  SIGNUP_SUCCESS,
  SIGNUP_ERROR,
  SIGNIN_SUCCESS,
  SIGNIN_ERROR,
  RESET_SUCCESS,
  RESET_ERROR
} from "../constants/actionTypes";
import { fetchSignUpForm, fetchSignInForm, fetchResetForm } from "../api/forms";
import { handleFetchDefaultPlaylist } from "./playlists";
import { handleFetchRatings } from "./ratings";

function* handleFetchSignUp(payload) {
  const { values } = payload;
  const { responseJson, error } = yield call(fetchSignUpForm, values);
  if (responseJson) yield put({ type: SIGNUP_SUCCESS, responseJson });
  else yield put({ type: SIGNUP_ERROR, error });
}

function* handleFetchSignIn(payload) {
  const { values } = payload;
  const { responseJson, error } = yield call(fetchSignInForm, values);
  if (responseJson) {
    yield all([call(handleFetchRatings), call(handleFetchDefaultPlaylist)]);
    yield put({ type: SIGNIN_SUCCESS, responseJson });
  } else yield put({ type: SIGNIN_ERROR, error });
}

function* handleFetchReset(payload) {
  const { values } = payload;
  const { responseJson, error } = yield call(fetchResetForm, values);
  if (responseJson) yield put({ type: RESET_SUCCESS, responseJson });
  else yield put({ type: RESET_ERROR, error });
}

export { handleFetchSignUp, handleFetchSignIn, handleFetchReset };
