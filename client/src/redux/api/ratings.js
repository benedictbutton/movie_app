import { normalize } from "normalizr";
import { ratingSchema } from "../schemas/schema";
import CustomError from "../../util/CustomError";

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
    let data = await response.json();
    if (!response.ok || data.status === "error")
      throw new CustomError(data.message, data.code, data.status);
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

async function ditchRating(payload) {
  try {
    const { movieId } = payload;
    let response = await fetch(
      `${process.env.REACT_APP_API_URL}/api/v1/ratings/${movieId}`,
      {
        credentials: "same-origin",
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.jwt}`
        },
        body: JSON.stringify(movieId)
      }
    );
    let responseJson = await response.json();
    if (!response.ok || responseJson.status === "error")
      throw new CustomError(
        responseJson.message,
        responseJson.code,
        responseJson.status
      );
    return { responseJson };
  } catch (error) {
    return { error };
  }
}

export { fetchRatings, ditchRating };
