import { call, put } from "redux-saga/effects";
import { RATINGS_SUCCESS, RATINGS_ERROR } from "../constants/actionTypes";
import { fetchRatings } from "../api/ratings";

function* handleFetchRatings(action) {
  const { responseJson, error } = yield call(fetchRatings, action);
  if (responseJson) yield put({ type: RATINGS_SUCCESS, responseJson });
  else yield put({ type: RATINGS_ERROR, error });
}

export { handleFetchRatings };
