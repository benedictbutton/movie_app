import { saveState } from "../../localStorage";

async function fetchSignUpForm(query) {
  try {
    let response = await fetch("/api/v1/users.json", {
      credentials: "same-origin",
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(query)
    });
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
    let response = await fetch("/authenticate.json", {
      credentials: "same-origin",
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(query)
    });
    let responseJson = await response.json();
    if (!response.ok) throw new Error(response);
    sessionStorage.setItem("jwt", responseJson.auth_token);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchSignUpForm, fetchSignInForm };
