import { schema, normalize } from "normalizr";
import { movieSchema, listSchema } from "../schemas/schema";

async function fetchMovies(query) {
  try {
    let ids = [1, 2, 3, 4, 5];
    const promises = ids.map(id => {
      return fetch(
        `https://api.themoviedb.org/4/list/${id}?api_key=77d5d44b891ceb6d4b5e717b8e2e9256`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json"
          }
        }
      );
    });
    const results = await Promise.all(promises);
    const data = await Promise.all(
      results.map(r => {
        if (!r.ok) throw new Error(r);
        return r.json();
      })
    );
    const responseJson = normalize(data, [listSchema]);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function postMovie(payload) {
  try {
    let response = await fetch("/api/v1/movies.json", {
      credentials: "same-origin",
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${sessionStorage.jwt}`
      },
      body: JSON.stringify(payload)
    });
    if (!response.ok) throw new Error(response);
    let responseJson = await response.json();
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchMovies, postMovie };
