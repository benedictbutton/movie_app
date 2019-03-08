import { takeEvery, takeLatest, all } from "redux-saga/effects";
import {
  SIGNUP_REQUESTING,
  SIGNIN_REQUESTING,
  USER_REQUESTING,
  MOVIES_REQUESTING,
  MY_MOVIES_REQUESTING,
  MOVIE_SEARCH_REQUESTING,
  PLAYLISTS_REQUESTING,
  PLAYLIST_REQUESTING,
  PLAYLIST_ADD_REQUESTING,
  PLAYLIST_ADD_MOVIE_REQUESTING,
  PLAYLIST_REMOVE_MOVIE_REQUESTING,
  MOVIE_POSTING
} from "../constants/actionTypes";
import { handleFetchSignUp, handleFetchSignIn } from "./forms";
import { handleFetchUser } from "./user";
import {
  handleFetchMovies,
  handleFetchMyMovies,
  handleFetchSearch,
  handlePostMovie
} from "./movies";
import {
  handleFetchPlaylists,
  handleFetchPlaylist,
  handlePostPlaylist,
  handlePostPlaylistMovie,
  handleDitchPlaylistMovie
} from "./playlists";

function* watchAll() {
  yield all([
    takeLatest(SIGNUP_REQUESTING, handleFetchSignUp),
    takeEvery(SIGNIN_REQUESTING, handleFetchSignIn),
    takeLatest(USER_REQUESTING, handleFetchUser),
    takeLatest(MOVIES_REQUESTING, handleFetchMovies),
    takeLatest(MY_MOVIES_REQUESTING, handleFetchMyMovies),
    takeLatest(MOVIE_SEARCH_REQUESTING, handleFetchSearch),
    takeLatest(MOVIE_POSTING, handlePostMovie),
    takeLatest(PLAYLISTS_REQUESTING, handleFetchPlaylists),
    takeLatest(PLAYLIST_REQUESTING, handleFetchPlaylist),
    takeLatest(PLAYLIST_ADD_REQUESTING, handlePostPlaylist),
    takeLatest(PLAYLIST_ADD_MOVIE_REQUESTING, handlePostPlaylistMovie),
    takeLatest(PLAYLIST_REMOVE_MOVIE_REQUESTING, handleDitchPlaylistMovie)
  ]);
}

// function* watchSignIn() {
//   while (true) {
//     const action = yield take(SIGNIN_REQUESTING);
//     console.log(action);
//
//     const task = yield fork(handleFetchSignIn, action);
//     console.log(task);
//     const newAction = yield take(RATINGS_REQUESTING);
//     console.log(newAction);
//   }
// }

export default watchAll;
