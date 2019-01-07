import { schema } from "normalizr";

const userSchema = new schema.Entity("users");

const ratingSchema = new schema.Entity(
  "rating",
  {},
  { idAttribute: "movie_id" }
);

const movieSchema = new schema.Entity("movies");

const listSchema = new schema.Entity("lists", { results: [movieSchema] });

export { userSchema, ratingSchema, movieSchema, listSchema };
