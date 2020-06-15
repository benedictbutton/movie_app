import React from "react";
import configureStore from "redux-mock-store";
import createSagaMiddleware from "redux-saga";
import { Provider } from "react-redux";
import { BrowserRouter as Router } from "react-router-dom";
import { store } from "../redux/store/configureStore";
import { doUserRequesting } from "../redux/actions/userActions";
import { UserContainer } from "../containers/UserContainer";
import User from "../components/User";

const user = {
  profile: {
    id: 7,
    firstName: "test",
    lastName: "user",
    username: "testuser",
    email: "testuser@email.com"
  },
  notifications: {
    body: null,
    message: "test",
    code: 404,
    display: true
  }
};

// const sagaMiddleware = createSagaMiddleware();
// const middlewares = [sagaMiddleware];
// const mockStore = configureStore(middlewares);

describe("UserContainer", () => {
  const dispatch = store.dispatch;
  jest.mock("../redux/actions/userActions", () => ({
    doUserRequesting: jest.fn()
  }));

  const wrapper = mount(
    <Provider store={store}>
      <UserContainer user={user} dispatch={dispatch} />
    </Provider>
  );

  it("render()", () => {
    expect(wrapper.find(User)).toHaveLength(1);
    const component = wrapper.find(User);
    expect(component.props().user.profile.firstName).toEqual("test");
    // wrapper.unmount();
  });
});
// });
