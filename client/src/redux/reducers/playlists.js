import {
  PLAYLISTS_REQUESTING,
  PLAYLISTS_SUCCESS,
  PLAYLIST_REQUESTING,
  PLAYLIST_SUCCESS,
  PLAYLIST_ADD_REQUESTING,
  PLAYLIST_ADD_SUCCESS,
  PLAYLIST_ADD_MOVIE_REQUESTING,
  PLAYLIST_ADD_MOVIE_SUCCESS,
  PLAYLIST_REMOVE_MOVIE_REQUESTING,
  PLAYLIST_REMOVE_MOVIE_SUCCESS,
  PLAYLIST_UPDATE_ACTIVE_REQUESTING,
  PLAYLIST_UPDATE_ACTIVE_SUCCESS,
  PLAYLIST_INITIALIZE,
  PLAYLISTS_ERROR,
  PLAYLISTS_REMOVE,
  TOGGLE_DISPLAY
} from "../constants/actionTypes";

const none = "none";
const INITIAL_STATE = {
  active: null,
  lists: [],
  playlistMovieIds: { [none]: [] },
  playlistMovies: {},
  requesting: false,
  successful: false,
  notifications: {}
};

const applyPlaylistsRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyPlaylistsSuccess = (state, action) => ({
  ...state,
  lists: action.responseJson,
  requesting: false,
  successful: true
});

const applyPlaylistRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyPlaylistSuccess = (state, action) => {
  const playlistId = action.responseJson.playlistId;
  return {
    ...state,
    playlistMovieIds: {
      ...state.playlistMovieIds,
      [playlistId]: action.responseJson.movies.result
    },
    playlistMovies: action.responseJson.movies.entities.movies,
    requesting: false,
    successful: true
  };
};

const applyPlaylistAddRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyPlaylistAddSuccess = (state, action) => {
  const { responseJson } = action;
  const activeId = responseJson.active ? responseJson.id : state.active;

  return {
    ...state,
    active: activeId,
    lists: [...state.lists, responseJson],
    playlistMovieIds: { ...state.playlistMovieIds, [responseJson.id]: [] },
    requesting: false,
    successful: true
  };
};

const applyPlaylistAddMovieRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyPlaylistAddMovieSuccess = (state, action) => {
  const playlistId = action.responseJson.playlistId;
  const movieId = action.responseJson.movieId;
  return {
    ...state,
    playlistMovieIds: {
      ...state.playlistMovieIds,
      [playlistId]: [...state.playlistMovieIds[playlistId], movieId],
      [none]: [...state.playlistMovieIds[playlistId], movieId]
    },
    requesting: false,
    successful: true
  };
};

const applyPlaylistRemoveMovieRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyPlaylistRemoveMovieSuccess = (state, action) => {
  const playlistId = action.responseJson.playlistId;
  const movieId = action.responseJson.movieId;
  const index = state.playlistMovieIds[playlistId].indexOf(movieId);
  const newState = Object.keys(state.playlistMovies).reduce((object, key) => {
    if (+key !== movieId) object[key] = state.playlistMovies[key];

    return object;
  }, {});

  return {
    ...state,
    playlistMovieIds: {
      ...state.playlistMovieIds,
      [playlistId]: [
        ...state.playlistMovieIds[playlistId].slice(0, index),
        ...state.playlistMovieIds[playlistId].slice(index + 1)
      ],
      [none]: [
        ...state.playlistMovieIds[playlistId].slice(0, index),
        ...state.playlistMovieIds[playlistId].slice(index + 1)
      ]
    },
    playlistMovies: newState,
    requesting: false,
    successful: true
  };
};

const applyPlaylistUpdateActiveRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyPlaylistUpdateActiveSuccess = (state, action) => {
  let activePlaylist = action.responseJson.playlist;
  let movieIds = action.responseJson.movies;
  return {
    ...state,
    active: activePlaylist,
    playlistMovieIds: { ...state.playlistMovieIds, [activePlaylist]: movieIds },
    requesting: false,
    successful: true
  };
};

const applyPlaylistInitialize = (state, action) => {
  const { active_id, all_movies, movies, playlists } = action.responseJson;
  let playlistMovies = {};
  if (active_id) playlistMovies = { [active_id]: movies };

  return {
    ...state,
    active: active_id,
    lists: playlists,
    playlistMovieIds: {
      ...{ ...state.playlistMovies, [none]: all_movies },
      ...playlistMovies
    },
    requesting: false,
    successful: true
  };
};

const applyPlaylistsError = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: action.error,
    message: `${action.error.message}` || "something went wrong",
    code: action.error.code,
    display: true
  },
  requesting: false,
  successful: false
});

const applyToggleDisplay = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: "",
    message: "",
    code: null,
    display: false
  }
});

function playlistsReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case PLAYLISTS_REQUESTING:
      return applyPlaylistsRequesting(state, action);
    case PLAYLISTS_SUCCESS:
      return applyPlaylistsSuccess(state, action);
    case PLAYLIST_REQUESTING:
      return applyPlaylistRequesting(state, action);
    case PLAYLIST_SUCCESS:
      return applyPlaylistSuccess(state, action);
    case PLAYLIST_ADD_REQUESTING:
      return applyPlaylistAddRequesting(state, action);
    case PLAYLIST_ADD_SUCCESS:
      return applyPlaylistAddSuccess(state, action);
    case PLAYLIST_ADD_MOVIE_REQUESTING:
      return applyPlaylistAddMovieRequesting(state, action);
    case PLAYLIST_ADD_MOVIE_SUCCESS:
      return applyPlaylistAddMovieSuccess(state, action);
    case PLAYLIST_REMOVE_MOVIE_REQUESTING:
      return applyPlaylistRemoveMovieRequesting(state, action);
    case PLAYLIST_REMOVE_MOVIE_SUCCESS:
      return applyPlaylistRemoveMovieSuccess(state, action);
    case PLAYLIST_UPDATE_ACTIVE_REQUESTING:
      return applyPlaylistUpdateActiveRequesting(state, action);
    case PLAYLIST_UPDATE_ACTIVE_SUCCESS:
      return applyPlaylistUpdateActiveSuccess(state, action);
    case PLAYLIST_INITIALIZE:
      return applyPlaylistInitialize(state, action);
    case PLAYLISTS_ERROR:
      return applyPlaylistsError(state, action);
    case PLAYLISTS_REMOVE:
      return INITIAL_STATE;
    case TOGGLE_DISPLAY:
      return applyToggleDisplay(state);
    default:
      return state;
  }
}

export default playlistsReducer;
