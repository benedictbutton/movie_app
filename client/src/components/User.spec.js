import React from "react";
// import { createMount } from "@material-ui/core/test-utils";
import { doUserRequesting } from "../redux/actions/userActions";
import { doUnSetError } from "../redux/actions/notificationActions";
import User from "./User";
import { UserContainer } from "../containers/UserContainer";
import toJson from "enzyme-to-json";
import Notifications from "./Notifications";
import { BrowserRouter as Router, MemoryRouter } from "react-router-dom";
// import { doUserRequesting } from "../redux/actions/userActions";
// import { getUser } from "../redux/selectors/selectors";
import configureStore from "redux-mock-store";

const props = {
  user: {
    profile: {
      firstName: "test",
      lastName: "user",
      username: "testuser",
      email: "testuser@email.com"
    },
    notifications: {
      message: "test"
    }
  }
};

const mockStore = configureStore();
const initialState = {};
const store = mockStore(initialState);

// Dispatch the action
store.dispatch(doUserRequesting());

describe("User", () => {
  test("render()", () => {
    const wrapper = shallow(<User />);
    console.log(wrapper.debug());
    expect(wrapper.exists()).toBe(true);
  });

  test("renders consistently", () => {
    const wrapper = shallow(<User {...props} />);
    const component = wrapper.dive();
    expect(toJson(component)).toMatchSnapshot();
  });
});

describe("UserContainer", () => {
  test("render()", () => {
    const wrapper = mount(<UserContainer {...props} />);
    expect(wrapper.find(User)).toHaveLength(1);
    wrapper.unmount();
  });
});
