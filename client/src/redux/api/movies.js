import { normalize } from "normalizr";
import { listSchema, movieSchema } from "../schemas/schema";
import CustomError from "../../util/CustomError";

const accessToken = process.env.REACT_APP_MOVIEDB_TOKEN;

async function fetchMovies(query) {
  try {
    let genreId = parseInt(query.genre, 10);
    let array = [1, 2, 3];
    let ids = array.map(num => num + query.page);
    const promises = ids.map(id => {
      return fetch(
        `https://api.themoviedb.org/4/discover/movie?with_genres=${genreId}&sort_by=popularity.desc&page=${id}`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${accessToken}`
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

async function fetchMyMovies() {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/movies.json`,
      {
        credentials: "same-origin",
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        }
      }
    );
    let resolvedResponse = await response.json();
    if (!response.ok)
      throw new CustomError(resolvedResponse.error, response.status);
    const responseJson = normalize(resolvedResponse, [movieSchema]);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function postMovie(payload) {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/movies.json`,
      {
        credentials: "same-origin",
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        },
        body: JSON.stringify(payload)
      }
    );
    let responseJson = await response.json();
    if (!response.ok) throw new Error(responseJson.error);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchMovies, fetchMyMovies, postMovie };
