import { call, put } from "redux-saga/effects";
import { push } from "connected-react-router";
import { USER_SUCCESS, USER_ERROR } from "../constants/actionTypes";
import { fetchUser } from "../api/user";

function* handleFetchUser(payload) {
  debugger;
  const { responseJson, error } = yield call(fetchUser);
  if (responseJson) yield put({ type: USER_SUCCESS, responseJson });
  else {
    yield put({ type: USER_ERROR, error });
    yield put(push("/ms/sign-in"));
  }
}

export { handleFetchUser };
