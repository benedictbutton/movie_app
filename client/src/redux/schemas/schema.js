import { schema } from "normalizr";

const userSchema = new schema.Entity("users");

const movieSchema = new schema.Entity("movies");

const listSchema = new schema.Entity("lists", { results: [movieSchema] });

export { userSchema, movieSchema, listSchema };
