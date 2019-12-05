import React from "react";
import renderer from "react-test-renderer";
import toJson from "enzyme-to-json";
import configureStore from "redux-mock-store";
import createSagaMiddleware from "redux-saga";
import { Provider } from "react-redux";
import { BrowserRouter as Router, MemoryRouter } from "react-router-dom";
import App from "../App";
import Notifications from "./Notifications";
import User from "./User";
import { UserContainer } from "../containers/UserContainer";

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

// console.log(wrapper.debug());

describe("User container/component", () => {
  let store;
  store = mockStore(initialState);
  beforeEach(() => jest.resetAllMocks());

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

  const dispatch = store.dispatch;

  jest.mock("../redux/actions/userActions", () => ({
    doUserRequesting: jest.fn()
  }));

  describe("UserContainer", () => {
    it("render()", () => {
      const wrapper = mount(
        <Provider store={store}>
          <UserContainer user={user} dispatch={dispatch} />
        </Provider>
      );
      expect(wrapper.find(User)).toHaveLength(1);
      const component = wrapper.find(User);
      expect(component.props().user.profile.firstName).toEqual("test");
      wrapper.unmount();
    });
  });

  let wrapper;
  describe("User", () => {
    test("renders consistently", () => {
      wrapper = shallow(<User user={user} />);
      const component = wrapper.dive();
      expect(toJson(component)).toMatchSnapshot();
    });

    it("render()", () => {
      // const wrapper = shallow(<User user={user} />);
      console.log(wrapper.debug());
      expect(wrapper.exists()).toBe(true);
      wrapper.unmount();
    });
  });
});
