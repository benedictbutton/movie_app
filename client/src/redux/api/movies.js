import { normalize } from "normalizr";
import { listSchema } from "../schemas/schema";

const accessToken =
  "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3N2Q1ZDQ0Yjg5MWNlYjZkNGI1ZTcxN2I4ZTJlOTI1NiIsInN1YiI6IjViZGI3YWZiYzNhMzY4NDAzMjAwMDFkMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._5X_Tv8-TJrTWsCzxVsZufVIY0u_aFWMfUi38r8loaY";

const queryKey = query => {
  if (query === "Drama") return 18;
  else if (query === "Comedy") return 35;
  else if (query === "Action") return 28;
  else if (query === "Romance") return 10749;
  else if (query === "Thriller") return 53;
  else if (query === "Documentary") return 99;
  else if (query === "SciFi") return 878;
  else if (query === "Horror") return 27;
  else return 18;
};

async function fetchMovies(query) {
  try {
    console.log(query);
    let genreId = queryKey(query);
    let ids = [1, 2, 3, 4, 5];
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
