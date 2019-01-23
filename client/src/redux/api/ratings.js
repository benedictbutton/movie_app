import { normalize } from "normalizr";
import { ratingSchema } from "../schemas/schema";

async function fetchRatings() {
  try {
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/ratings.json`,
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
    if (data.length === 0) {
      let responseJson = { entities: { rating: {} } };
      return { responseJson };
    }
    let responseJson = normalize(data, [ratingSchema]);
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchRatings };
