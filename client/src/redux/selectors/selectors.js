export const getClient = state => state.client;

export const getClientNotifications = state => state.client.notifications;

export const getUser = state => state.user;

export const getRatings = state => state.ratings;

export const getMovies = state => state.movies;

export const getMoviesAsErrors = state => state.movies.notifications;

export const getMoviesAsIds = (state, id) => {
  return state.movies.list[id];
};

export const getMoviesAsList = state => {
  return state.movies.list;
};

export const getActivePlaylist = state => state.playlists.active;

export const getPlaylistMovieIds = state => state.playlists.playlistMovieIds;

export const getPlaylistMovies = state => state.playlists.playlistMovies;

export const getPlaylistErrors = state => state.playlists.notifications;

export const getMoviesRated = (state, id) => {
  return state[id];
};

export const getRatingsAsIds = state => Object.keys(state.ratings.list);

export const getRatedMovies = state => state.movies.ratedList;

export const getSearchedMovies = state => state.movies.searchList;
