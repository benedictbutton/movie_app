import {
  PLAYLISTS_REQUESTING,
  PLAYLIST_REQUESTING,
  PLAYLIST_ADD_REQUESTING,
  PLAYLIST_ADD_MOVIE_REQUESTING,
  PLAYLIST_REMOVE_MOVIE_REQUESTING,
  PLAYLIST_UPDATE_ACTIVE_REQUESTING,
  PLAYLIST_INITIALIZE,
  PLAYLISTS_REMOVE
} from "../constants/actionTypes";

const doPlaylistsRequesting = () => ({
  type: PLAYLISTS_REQUESTING
});

const doPlaylistRequesting = query => ({
  type: PLAYLIST_REQUESTING,
  query
});

const doPlaylistAddRequesting = values => ({
  type: PLAYLIST_ADD_REQUESTING,
  values
});

const doPlaylistAddMovieRequesting = (playlist, movie) => ({
  type: PLAYLIST_ADD_MOVIE_REQUESTING,
  payload: { playlist: playlist, movie: movie }
});

const doPlaylistRemoveMovieRequesting = (playlist, movie) => ({
  type: PLAYLIST_REMOVE_MOVIE_REQUESTING,
  payload: { playlistId: playlist, movieId: movie }
});

const doPlaylistUpdateActiveRequesting = playlist => ({
  type: PLAYLIST_UPDATE_ACTIVE_REQUESTING,
  playlist
});

const doPlaylistsRemove = () => ({
  type: PLAYLISTS_REMOVE
});

const doPlaylistInitialize = () => ({
  type: PLAYLIST_INITIALIZE
});

export {
  doPlaylistsRequesting,
  doPlaylistRequesting,
  doPlaylistAddRequesting,
  doPlaylistAddMovieRequesting,
  doPlaylistRemoveMovieRequesting,
  doPlaylistUpdateActiveRequesting,
  doPlaylistInitialize,
  doPlaylistsRemove
};
