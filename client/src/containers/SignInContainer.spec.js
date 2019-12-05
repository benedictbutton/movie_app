import React from "react";
import { Provider } from "react-redux";
import { BrowserRouter as Router } from "react-router-dom";
import { reduxForm } from "redux-form";
import { doSignInRequesting } from "../redux/actions/formActions";
import { store } from "../redux/store/configureStore";
import SignInContainer from "./SignInContainer";
import * as formActions from "../redux/actions/formActions";

const props = {
  handleSubmit: jest.fn()
};

const onSubmit = jest.fn();
const wrapper = mount(
  <Provider store={store}>
    <Router>
      <SignInContainer onSubmit={onSubmit} {...props} />
    </Router>
  </Provider>
);

it("signin a user with correct info", () => {
  wrapper
    .find("input#email")
    .simulate("change", { target: { value: "testuser3@email.com" } });
  wrapper
    .find("input#password")
    .simulate("change", { target: { value: "Password7" } });
  wrapper.find("form").simulate("submit");
  expect(props.handleSubmit).toHaveBeenCalled();
});
