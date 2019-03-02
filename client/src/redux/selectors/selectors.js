const getClient = state => state.client;

const getClientNotifications = state => state.client.notifications;

const getUser = state => state.user;

const getRatings = state => state.ratings;

const getMovies = state => state.movies;

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
  getClientNotifications,
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
