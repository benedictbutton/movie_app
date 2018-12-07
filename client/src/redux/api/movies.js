import { schema, normalize } from "normalizr";
import { movieSchema, listSchema } from "../schemas/schema";

const header = {
  method: "GET",
  headers: {
    "Content-Type": "application/json"
  }
};

async function fetchMovies(query) {
  let ids = [1, 2, 3, 4, 5];
  const promises = ids.map(id => {
    return fetch(
      `https://api.themoviedb.org/4/list/${id}?api_key=77d5d44b891ceb6d4b5e717b8e2e9256`,
      header
    );
  });
  const results = await Promise.all(promises);
  const data = await Promise.all(results.map(r => r.json()));
  const normalizedData = normalize(data, [listSchema]);

  return normalizedData;
}

export { fetchMovies };
