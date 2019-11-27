import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
import { BrowserRouter as Router } from "react-router-dom";

import { Provider } from "react-redux";
import renderer from "react-test-renderer";
import configureStore from "redux-mock-store";
import createSagaMiddleware from "redux-saga";

const sagaMiddleware = createSagaMiddleware();
const middlewares = [sagaMiddleware];
const mockStore = configureStore(middlewares);
const initialState = {
  client: {
    requesting: false,
    successful: false,
    admin: false,
    reset: false,
    notifications: { message: "test" }
  },
  user: {
    profile: {
      id: 7,
      firstName: "test",
      lastName: "user",
      username: "testuser",
      email: "testuser@email.com"
    },
    requesting: false,
    successful: false,
    notifications: {
      body: null,
      message: "test",
      code: 404,
      display: true
    }
  }
};

describe("Render App Component", () => {
  let store = mockStore(initialState);
  it("renders without crashing", () => {
    const div = document.createElement("div");
    ReactDOM.render(
      <Provider store={store}>
        <Router>
          <App />
        </Router>
      </Provider>,
      div
    );
    ReactDOM.unmountComponentAtNode(div);
  });
});
