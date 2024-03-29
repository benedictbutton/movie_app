import { createStore, applyMiddleware } from "redux";
import { createLogger } from "redux-logger";
import createSagaMiddleware from "redux-saga";
import rootReducer from "../reducers/index";
import rootSaga from "../sagas";
import { loadState, saveState } from "../../localStorage";
import throttle from "lodash/throttle";

const logger = createLogger();
const saga = createSagaMiddleware();
const persistedState = loadState();

const store = createStore(
  rootReducer,
  persistedState,
  applyMiddleware(saga, logger)
);

saga.run(rootSaga);

store.subscribe(
  throttle(() => {
    if (store.getState().client.successful) {
      saveState({
        client: store.getState().client,
        user: store.getState().user,
        ratings: store.getState().ratings,
        playlists: store.getState().playlists
      });
    }
  }, 1000)
);

export { store };
