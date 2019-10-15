import { createSelector } from "reselect";

export const getClient = state => state.client;

export const getAdmin = state => state.client.admin;

export const getClientNotifications = state => state.client.notifications;

export const getUser = state => state.user;

export const getPlaylists = state => state.playlists.lists;

export const getRatings = state => state.ratings;

export const getMovies = state => state.movies;

export const getMoviesRequesting = state => state.movies.requesting;

export const getMoviesAsErrors = state => state.movies.notifications;

export const getMoviesAsIds = (state, id) => {
  return state.movies.list[id];
};

export const getMoviesAsList = state => {
  return state.movies.list;
};

export const getCast = state => state.movies.cast;

export const getActivePlaylist = state => state.playlists.active;

export const getPlaylistMovieIds = state => state.playlists.playlistMovieIds;

export const getPlaylistMovies = state => state.playlists.playlistMovies;

export const getPlaylistTitle = (state, id) => {
  let list = state.playlists.lists.filter(el => el.id === +id);

  return list[0].name;
};

export const getPlaylistErrors = state => state.playlists.notifications;

export const getMoviesRated = (state, id) => {
  return state[id];
};

export const getRatingsAsIds = state => Object.keys(state.ratings.list);

export const getRatingsList = state => state.ratings.list;

export const getRatedMovies = state => state.movies.ratedList;

export const getSearchedMovies = state => state.movies.searchList;

export const getMovieFilter = state => state.movies.filter;

export const getFilteredRatings = createSelector(
  [getRatedMovies, getMovieFilter, getRatingsList],
  (ratedMovies, filter, ratingsList) => {
    switch (filter) {
      case "all":
        return Object.values(ratedMovies);
      case "fiveStar":
        return Object.values(ratedMovies).filter(
          movie => ratingsList[movie.id].score === 5
        );
      case "fourStar":
        return Object.values(ratedMovies).filter(
          movie => ratingsList[movie.id].score === 4
        );
      case "threeStar":
        return Object.values(ratedMovies).filter(
          movie => ratingsList[movie.id].score === 3
        );
      case "twoStar":
        return Object.values(ratedMovies).filter(
          movie => ratingsList[movie.id].score === 2
        );
      case "oneStar":
        return Object.values(ratedMovies).filter(
          movie => ratingsList[movie.id].score === 1
        );
      default:
        return Object.values(ratedMovies);
    }
  }
);
