import CustomError from "../../util/CustomError";

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
    let responseJson = await response.json();
    if (!response.ok)
      throw new CustomError(responseJson.error, response.status);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchUser };
