import { call, put } from "redux-saga/effects";
import {
  PLAYLISTS_SUCCESS,
  PLAYLIST_SUCCESS,
  PLAYLIST_ADD_SUCCESS,
  PLAYLIST_ADD_MOVIE_SUCCESS,
  PLAYLIST_REMOVE_MOVIE_SUCCESS,
  PLAYLIST_UPDATE_ACTIVE_SUCCESS,
  PLAYLIST_INITIALIZE,
  PLAYLISTS_ERROR
} from "../constants/actionTypes";
import {
  fetchPlaylists,
  fetchPlaylist,
  fetchDefaultPlaylist,
  postPlaylist,
  postPlaylistMovie,
  updateActivePlaylist,
  ditchPlaylistMovie
} from "../api/playlists";

function* handleFetchPlaylists() {
  const { responseJson, error } = yield call(fetchPlaylists);
  if (responseJson) yield put({ type: PLAYLISTS_SUCCESS, responseJson });
  else yield put({ type: PLAYLISTS_ERROR, error });
}

function* handleFetchPlaylist(action) {
  const { query } = action;
  const { responseJson, error } = yield call(fetchPlaylist, query);
  if (responseJson) yield put({ type: PLAYLIST_SUCCESS, responseJson });
  else yield put({ type: PLAYLISTS_ERROR, error });
}

function* handleFetchDefaultPlaylist() {
  const { responseJson, error } = yield call(fetchDefaultPlaylist);
  if (responseJson) yield put({ type: PLAYLIST_INITIALIZE, responseJson });
  else yield put({ type: PLAYLISTS_ERROR, error });
}

function* handlePostPlaylist(payload) {
  const { values } = payload;
  const { responseJson, error } = yield call(postPlaylist, values);
  if (responseJson) yield put({ type: PLAYLIST_ADD_SUCCESS, responseJson });
  else yield put({ type: PLAYLISTS_ERROR, error });
}

function* handlePostPlaylistMovie(payload) {
  const { responseJson, error } = yield call(postPlaylistMovie, payload);
  if (responseJson)
    yield put({ type: PLAYLIST_ADD_MOVIE_SUCCESS, responseJson });
  else yield put({ type: PLAYLISTS_ERROR, error });
}

function* handleUpdateActivePlaylist(payload) {
  const { responseJson, error } = yield call(updateActivePlaylist, payload);
  if (responseJson)
    yield put({ type: PLAYLIST_UPDATE_ACTIVE_SUCCESS, responseJson });
  else yield put({ type: PLAYLISTS_ERROR, error });
}

function* handleDitchPlaylistMovie(payload) {
  const { responseJson, error } = yield call(ditchPlaylistMovie, payload);
  if (responseJson)
    yield put({ type: PLAYLIST_REMOVE_MOVIE_SUCCESS, responseJson });
  else yield put({ type: PLAYLISTS_ERROR, error });
}

export {
  handleFetchPlaylists,
  handleFetchPlaylist,
  handleFetchDefaultPlaylist,
  handlePostPlaylist,
  handlePostPlaylistMovie,
  handleUpdateActivePlaylist,
  handleDitchPlaylistMovie
};
