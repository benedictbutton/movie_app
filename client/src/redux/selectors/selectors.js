const getClient = state => state.client;

const getUser = state => state.user;

const getMovies = state => state.movies;

const getMoviesAsIds = (state, id) => state.movies.list[id];

const getRatings = state => state.ratings;

export { getClient, getUser, getMovies, getMoviesAsIds, getRatings };
