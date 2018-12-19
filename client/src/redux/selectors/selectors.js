// import { movieSchema, listSchema } from "../schemas/schema";
//
// const getMovies = state => {
//   debugger;
//   // const entities = state.movies.entities;
//
//   const ids = "hello";
//   // state.movies.ids;
//   return ids;
// };
//
// export { getMovies };

const getClient = state => state.client;

const getUser = state => state.user;

const getMovies = state => state.movies;

export { getClient, getUser, getMovies };
