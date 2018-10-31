import { call, put } from "redux-saga/effects";
import { doShowUser } from "../actions/userActions";
import { fetchUser } from "../api/user";

function* handleFetchUser(query) {
  const result = yield call(fetchUser, query);
  yield put(doShowUser(result));
}

export { handleFetchUser };
