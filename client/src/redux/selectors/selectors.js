const getClient = state => state.client;

const getUser = state => state.user;

const getMovies = state => state.movies;

const getRatings = state => state.ratings;

const getMoviesAsErrors = state => state.movies.notifications;

const getMoviesAsIds = (state, id) => state.movies.list[id];

const getMoviesAsList = state => {
  return state.movies.list;
};

const getMoviesRated = (state, id) => {
  return state[id];
};

const getRatingsAsIds = state => Object.keys(state.ratings.list);

const getRatedMovies = state => state.movies.ratedList;

export {
  getClient,
  getUser,
  getMovies,
  getMoviesAsErrors,
  getMoviesAsIds,
  getMoviesAsList,
  getMoviesRated,
  getRatings,
  getRatingsAsIds,
  getRatedMovies
};
