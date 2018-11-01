async function fetchUser(query) {
  debugger;
  try {
    let response = await fetch("/api/v1/users/:id", {
      credentials: "same-origin",
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        AUTHORIZATION: `Bearer ${sessionStorage.jwt}`
      },
      body: JSON.stringify(query)
    });
    let responseJson = await response.json();
    return responseJson;
  } catch (error) {
    console.log(error);
  }
}

export { fetchUser };
