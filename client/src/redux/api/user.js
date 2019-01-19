async function fetchUser() {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/users/:id`,
      {
        credentials: "same-origin",
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        }
      }
    );
    if (!response.ok) throw new Error(response);
    let responseJson = await response.json();
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchUser };
