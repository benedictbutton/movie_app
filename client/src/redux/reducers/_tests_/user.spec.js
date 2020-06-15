import userReducer from "../user";
import {
  USER_REQUESTING,
  USER_SUCCESS,
  USER_ERROR,
  TOGGLE_DISPLAY
} from "../../constants/actionTypes";

describe("user reducer", () => {
  it("return default state", () => {
    expect(userReducer(undefined, {})).toEqual({
      profile: {
        id: null,
        firstName: null,
        lastName: null,
        username: "",
        email: ""
      },
      requesting: false,
      successful: false,
      notifications: {}
    });
  });

  it("should handle USER_SUCCESS", () => {
    expect(
      userReducer(undefined, {
        type: USER_SUCCESS,
        responseJson: {
          id: 0,
          first_name: "test",
          last_name: "user",
          username: "testuser",
          email: "testuser@email.com"
        }
      })
    ).toEqual({
      profile: {
        id: 0,
        firstName: "test",
        lastName: "user",
        username: "testuser",
        email: "testuser@email.com"
      },
      requesting: false,
      successful: true,
      notifications: {}
    });
  });
});
