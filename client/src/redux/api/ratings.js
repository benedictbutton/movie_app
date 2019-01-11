import { normalize } from "normalizr";
import { ratingSchema } from "../schemas/schema";

async function fetchRatings() {
  try {
    let response = await fetch(
      " https://my-movie-database.herokuapp.com/api/v1/ratings.json",
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
    let data = await response.json();
    data = data.ratings;
    let responseJson = normalize(data, [ratingSchema]);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchRatings };
