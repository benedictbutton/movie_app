import { call, put } from "redux-saga/effects";
import {
  SIGNUP_SUCCESS,
  SIGNUP_ERROR,
  SIGNIN_SUCCESS,
  SIGNIN_ERROR
} from "../constants/actionTypes";
import { fetchSignUpForm, fetchSignInForm } from "../api/forms";
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
    yield call(handleFetchRatings);
    yield put({ type: SIGNIN_SUCCESS, responseJson });
  } else yield put({ type: SIGNIN_ERROR, error });
}

export { handleFetchSignUp, handleFetchSignIn };
