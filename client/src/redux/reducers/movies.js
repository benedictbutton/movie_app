import { SHOW_MOVIES } from "../constants/actionTypes";

const INITIAL_STATE = [];

const applyShowMovies = (state, action) => {
  // let imageUrl = "https://image.tmdb.org/t/p/w500/" + action.movies.poster_path;
  // debugger;
  let newState = [];
  let movies = action.payload.map(array => array.results);

  movies.forEach(array => {
    for (let movie of array) {
      newState.push(movie);
    }
  });

  return [...state, ...newState];
  debugger;
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
