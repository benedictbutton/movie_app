import playlistsReducer from "../playlists";
import {
  PLAYLISTS_REQUESTING,
  PLAYLISTS_SUCCESS,
  PLAYLIST_REQUESTING,
  PLAYLIST_SUCCESS
} from "../../constants/actionTypes";
import { playlistsSuccess, playlistSuccess } from "../../../util/testData";
import deepFreeze from "deep-freeze";

const initialState = {
  active: null,
  lists: [],
  playlistMovieIds: { none: [] },
  playlistMovies: {},
  requesting: false,
  successful: false,
  notifications: {}
};

describe("playlist reducer", () => {
  it("return default state", () => {
    expect(playlistsReducer(undefined, {})).toEqual(initialState);
  });

  it("should handle PLAYLISTS_SUCCESS", () => {
    const { beforeState, afterState } = playlistsSuccess;
    const action = playlistsSuccess.action("PLAYLISTS_SUCCESS");
    deepFreeze(beforeState);
    deepFreeze(action);
    expect(playlistsReducer(beforeState, action)).toEqual(afterState);
  });

  it("should handle PLAYLIST_SUCCESS", () => {
    const { beforeState, afterState } = playlistSuccess;
    const action = playlistSuccess.action("PLAYLIST_SUCCESS");
    deepFreeze(beforeState);
    deepFreeze(action);
    expect(playlistsReducer(beforeState, action)).toEqual(afterState);
  });
});
