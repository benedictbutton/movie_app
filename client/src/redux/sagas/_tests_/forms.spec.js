import { runSaga } from "redux-saga";
import { handleFetchSignUp } from "../forms";
import { fetchSignUpForm } from "../../api/forms";

const responseJson = {
  id: 7,
  firstName: "test",
  lastName: "user",
  username: "testuser",
  email: "testuser@email.com"
};
const error = "This is a failing test";

jest.mock("../../api/forms", () => ({
  fetchSignUpForm: jest.fn()
}));

export async function recordSaga(saga, initialAction) {
  const dispatched = [];
  await runSaga(
    {
      dispatch: action => dispatched.push(action)
    },
    saga,
    initialAction
  ).done;

  return dispatched;
}

describe("forms saga", () => {
  beforeEach(() => {
    jest.resetAllMocks();
  });
  describe("handleFetchSignUp", () => {
    it("should fail if not authenticated", async () => {
      const initialAction = { profileId: 1 };
      fetchSignUpForm.mockImplementation(() => ({ error }));
      const dispatched = await recordSaga(handleFetchSignUp, initialAction);
      expect(dispatched[0].type).toEqual("SIGNUP_ERROR");
    });

    it("should not fail if authenticated", async () => {
      const initialAction = { profileId: 1 };
      fetchSignUpForm.mockImplementation(() => ({ responseJson }));
      const dispatched = await recordSaga(handleFetchSignUp, initialAction);
      expect(dispatched[0].type).toEqual("SIGNUP_SUCCESS");
    });
  });
});
