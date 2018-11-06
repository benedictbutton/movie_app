import { SHOW_MOVIES } from "../constants/actionTypes";

const INITIAL_STATE = [];

const applyShowMovies = (state, action) => {
  // let imageUrl = "https://image.tmdb.org/t/p/w500/" + action.movies.poster_path;
  let movies = action.payload.map(movie => {
    return (state = [...state, movie]);
  });
  return state;
};

function moviesReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case SHOW_MOVIES: {
      return applyShowMovies(state, action);
    }
    default:
      return state;
  }
}

export default moviesReducer;
