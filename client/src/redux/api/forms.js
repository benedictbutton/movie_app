import CustomError from "../../util/CustomError";

async function fetchSignUpForm(payload) {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/users.json`,
      {
        credentials: "same-origin",
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
      }
    );
    let responseJson = await response.json();
    if (!response.ok) {
      const error = responseJson.email[0];
      throw new Error(error);
    }
    sessionStorage.setItem("jwt", responseJson.auth_token);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function fetchSignInForm(query) {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/authenticate.json`,
      {
        credentials: "same-origin",
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(query)
      }
    );
    let responseJson = await response.json();
    if (!response.ok) {
      throw new CustomError(responseJson.message, responseJson.code);
    }
    sessionStorage.setItem("jwt", responseJson.auth_token);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchSignUpForm, fetchSignInForm };
