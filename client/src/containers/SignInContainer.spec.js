import React from "react";
import { Provider } from "react-redux";
import { BrowserRouter as Router } from "react-router-dom";
import { reduxForm } from "redux-form";
import { doSignInRequesting } from "../redux/actions/formActions";
import { store } from "../redux/store/configureStore";
import SignInContainer from "./SignInContainer";
import * as formActions from "../redux/actions/formActions";
import { fetchSignInForm } from "../redux/api/forms";
import { fetchDefaultPlaylist } from "../redux/api/playlists";
import { fetchRatings } from "../redux/api/ratings";

jest.mock("../redux/api/forms", () => ({
  fetchSignInForm: jest.fn()
}));
fetchSignInForm.mockImplementation(() => {
  const responseJson = {
    id: 7,
    firstName: "test",
    lastName: "user",
    username: "testuser",
    email: "testuser@email.com"
  };
  return { responseJson };
});

jest.mock("../redux/api/playlists", () => ({
  fetchDefaultPlaylist: jest.fn(() => {
    const responseJson = {
      11: [291328, 152603, 45612],
      4: [1124, 1262, 10162],
      13: [4836, 77016, 62668]
    };

    return { responseJson };
  })
}));
// fetchDefaultPlaylist.mockImplementation(() => {
//   const responseJson = {
//     11: [291328, 152603, 45612],
//     4: [1124, 1262, 10162],
//     13: [4836, 77016, 62668]
//   };
//
//   return { responseJson };
// });

jest.mock("../redux/api/ratings", () => ({
  fetchRatings: jest.fn()
}));
fetchRatings.mockImplementation(() => {
  const responseJson = {
    entities: {
      rating: {
        11: {
          id: 39,
          user_id: 2,
          movie_id: 11,
          score: 5
        },
        13: {
          id: 719,
          user_id: 2,
          movie_id: 13,
          score: 5
        },
        14: { id: 266, user_id: 2, movie_id: 14, score: 3 }
      }
    }
  };
  return { responseJson };
});

const wrapper = mount(
  <Provider store={store}>
    <Router>
      <SignInContainer />
    </Router>
  </Provider>
);

describe("SignInContainer", () => {
  it("signin a user with correct info", () => {
    wrapper
      .find("input#email")
      .simulate("change", { target: { value: "testuser3@email.com" } });
    wrapper
      .find("input#password")
      .simulate("change", { target: { value: "Password7" } });
    wrapper.find("form").simulate("submit", { preventDefault() {} });
    expect(fetchSignInForm).toHaveBeenCalled();
    expect(fetchDefaultPlaylist).toHaveBeenCalled();
    expect(fetchRatings).toHaveBeenCalled();
  });
});
