import React from "react";
// import { createMount } from "@material-ui/core/test-utils";
import User from "./User";
// import Notifications from "./Notifications";
// import { BrowserRouter as Router, MemoryRouter } from "react-router-dom";
// import { doUserRequesting } from "../redux/actions/userActions";
// import { getUser } from "../redux/selectors/selectors";
// import configureStore from "redux-mock-store";
// const mockStore = configureStore();

describe("User", () => {
  test("renders()", () => {
    const wrapper = shallow(<User />);
    console.log(wrapper.debug());
    expect(wrapper.exists()).toBe(true);
  });
});
