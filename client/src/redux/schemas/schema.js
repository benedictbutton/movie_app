import { schema } from "normalizr";

const movieSchema = new schema.Entity("movies");

const listSchema = new schema.Entity("lists", { results: [movieSchema] });

export { movieSchema, listSchema };
