import React from "react";
import renderer from "react-test-renderer";
import toJson from "enzyme-to-json";
import configureStore from "redux-mock-store";
import createSagaMiddleware from "redux-saga";
import { Provider } from "react-redux";
import { BrowserRouter as Router, MemoryRouter } from "react-router-dom";
import App from "../App";
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

describe("User container/component", () => {
  let store;

  beforeEach(() => {
    jest.resetAllMocks();
    store = mockStore(initialState);
    renderer.create(
      <Provider store={store}>
        <Router>
          <App />
        </Router>
      </Provider>
    );
  });

  // afterEach(() => {
  //   wrapper.unmount();
  // });

  const user = {
    profile: {
      id: 7,
      firstName: "test",
      lastName: "user",
      username: "testuser",
      email: "testuser@email.com"
    }
  };

  jest.mock("../redux/actions/userActions", () => ({
    doUserRequesting: jest.fn()
  }));

  describe("UserContainer", () => {
    it("render()", () => {
      const wrapper = mount(<UserContainer />);
      console.log(wrapper.debug());
      expect(wrapper.find(User)).toHaveLength(1);
      expect(wrapper.find(User))
        .props()
        .firstName.to.equal("test");
    });
  });

  describe("User", () => {
    test("renders consistently", () => {
      const wrapper = shallow(<User user={user} />);
      const component = wrapper.dive();
      expect(toJson(component)).toMatchSnapshot();
      wrapper.unmount();
    });

    it("render()", () => {
      const wrapper = shallow(<User user={user} />);
      console.log(wrapper.debug());
      expect(wrapper.exists()).toBe(true);
      wrapper.unmount();
    });
  });
});
