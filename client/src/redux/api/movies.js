async function fetchMovies(query) {
  try {
    let response = await fetch(
      "https://api.themoviedb.org/4/list/1?api_key=77d5d44b891ceb6d4b5e717b8e2e9256",
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json"
        }
      }
    );
    let responseJson = await response.json();
    console.log(responseJson);
    return responseJson;
  } catch (error) {
    console.log(error);
  }
}

export { fetchMovies };
