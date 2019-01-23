const getClient = state => state.client;

const getUser = state => state.user;

const getMovies = state => state.movies;

const getMoviesAsIds = (state, id) => state.movies.list[id];

const getMoviesAsList = state => {
  return state.movies.list;
};

const getMoviesRated = (state, id) => {
  return state[id];
};

const getRatings = state => state.ratings;

const getRatingsAsIds = state => Object.keys(state.ratings.list);

export {
  getClient,
  getUser,
  getMovies,
  getMoviesAsIds,
  getMoviesAsList,
  getMoviesRated,
  getRatings,
  getRatingsAsIds
};
