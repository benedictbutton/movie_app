import { call, put } from "redux-saga/effects";
import { USER_SUCCESS, USER_ERROR } from "../constants/actionTypes";
import { fetchUser } from "../api/user";

function* handleFetchUser(action) {
  const { responseJson, error } = yield call(fetchUser, action);
  if (responseJson) yield put({ type: USER_SUCCESS, responseJson });
  else yield put({ type: USER_ERROR, error });
}

export { handleFetchUser };
