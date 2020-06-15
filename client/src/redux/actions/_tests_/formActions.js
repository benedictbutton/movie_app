import * as actions from "../formActions";

describe("form actions", () => {
  it("should create a doSignUpRequesting action", () => {
    const values = { email: "testuser@email.com", password: "Password7" };
    const expectedAction = {
      type: types.SIGNUP_REQUESTING,
      values
    };
    expect(actions.doSignUpRequesting(values)).toEqual(expectedAction);
  });
});
