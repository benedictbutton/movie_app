import { normalize } from "normalizr";
import { listSchema, movieSchema } from "../schemas/schema";
import CustomError from "../../util/CustomError";

const accessToken = process.env.REACT_APP_MOVIEDB_TOKEN;

const tmdbUrl = query => {
  const base = `https://api.themoviedb.org/3/`;
  const middle = query => {
    // let genreId = parseInt(query.tag, 10);
    const appendage =
      query.type === "discover"
        ? `discover/movie?with_genres=${query.tag}`
        : query.type === "search"
        ? `&query=${encodeURIComponent(query.tag)}`
        : `${query.tag}`;
    return appendage;
  };
  const postfix = `&sort_by=popularity.desc&include_adult=false&language=en-US&api_key=77d5d44b891ceb6d4b5e717b8e2e9256`;
  return base + middle(query) + postfix;
};

async function fetchMovies(query) {
  let compiledUrl = tmdbUrl(query);
  try {
    let array = [1, 2, 3];
    let ids = array.map(num => num + query.page);
    const promises = ids.map(id => {
      return fetch(`${compiledUrl}&page=${id}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json"
          // Authorization: `Bearer ${accessToken}`
        }
      });
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
      throw new CustomError(resolvedResponse.message, resolvedResponse.code);
    const responseJson = normalize(resolvedResponse, [movieSchema]);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function fetchSearch(query) {
  try {
    let response = await fetch(
      `https://api.themoviedb.org/3/search/multi?include_adult=false&page=1&language=en-US&query=${encodeURIComponent(
        query.query.tag
      )}&api_key=77d5d44b891ceb6d4b5e717b8e2e9256`,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${accessToken}`
        }
      }
    );
    const data = await response.json();
    const resolvedResponse = data.results;
    const responseJson = normalize(resolvedResponse, [listSchema]);
    if (!response.ok) throw new Error(responseJson.error);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

async function fetchCategory(query) {
  try {
    let response = await fetch(
      `https://api.themoviedb.org/3/${query.tag}?include_adult=false&page=${
        query.page
      }&language=en-US&api_key=77d5d44b891ceb6d4b5e717b8e2e9256`,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json"
          // Authorization: `Bearer ${accessToken}`
        }
      }
    );
    const data = await response.json();
    const resolvedResponse = data.results;
    const responseJson = normalize(resolvedResponse, [listSchema]);
    if (!response.ok) throw new Error(responseJson.error);
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

export { fetchMovies, fetchMyMovies, fetchSearch, fetchCategory, postMovie };
