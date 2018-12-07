import { createStore, applyMiddleware, compose } from "redux";
import { createBrowserHistory } from "history";
import { routerMiddleware } from "connected-react-router";
import { createLogger } from "redux-logger";
import createSagaMiddleware from "redux-saga";
import rootReducer from "../reducers/index";
import rootSaga from "../sagas";
import { loadState, saveState } from "../../localStorage";
import throttle from "lodash/throttle";

const logger = createLogger();
const saga = createSagaMiddleware();
const persistedState = loadState();
const history = createBrowserHistory();

const store = createStore(
  rootReducer(history),
  persistedState,
  compose(applyMiddleware(routerMiddleware(history), saga, logger))
);

saga.run(rootSaga);

store.subscribe(
  throttle(() => {
    saveState({
      user: store.getState().user
    });
  }, 1000)
);

export { store, history };
