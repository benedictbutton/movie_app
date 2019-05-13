import { call, put } from "redux-saga/effects";
import {
  RATINGS_SUCCESS,
  RATING_REMOVE_SUCCESS,
  RATINGS_ERROR
} from "../constants/actionTypes";
import { fetchRatings, ditchRating } from "../api/ratings";

function* handleFetchRatings(action) {
  const { responseJson, error } = yield call(fetchRatings, action);
  if (responseJson) yield put({ type: RATINGS_SUCCESS, responseJson });
  else yield put({ type: RATINGS_ERROR, error });
}

function* handleDitchRating(payload) {
  const { responseJson, error } = yield call(ditchRating, payload);
  if (responseJson) yield put({ type: RATING_REMOVE_SUCCESS, responseJson });
  else yield put({ type: RATINGS_ERROR, error });
}

export { handleFetchRatings, handleDitchRating };
