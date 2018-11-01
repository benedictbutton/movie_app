async function postSignUpForm(query) {
  try {
    let response = await fetch("/api/v1/users.json", {
      credentials: "same-origin",
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(query)
    });
    let responseJson = await response.json();
    return responseJson;
  } catch (error) {
    console.log(error);
  }
}

export { postSignUpForm };
