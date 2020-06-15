import React from "react";
import { Provider } from "react-redux";
import { BrowserRouter as Router } from "react-router-dom";
import { store } from "../redux/store/configureStore";
import { reduxForm } from "redux-form";
import {
  doPlaylistsRequesting,
  doPlaylistAddRequesting
} from "../redux/actions/playlistActions";
import { fetchPlaylists, postPlaylist } from "../redux/api/playlists";
import PlaylistsContainer from "./PlaylistContainer";
import PlaylistCards from "../components/PlaylistCards";
import { initialState } from "../util/testData";

jest.mock("../redux/api/playlists", () => ({
  fetchPlaylists: jest.fn(() => {
    const responseJson = {
      movies: {
        entities: {
          movies: {
            107: { id: 107, title: "Snatch" },
            8321: { id: 8321, title: "In Bruges" },
            82633: { id: 82633, title: "Lawless" }
          },
          result: [107, 832, 826633]
        }
      }
    };
    return { responseJson };
  })
}));

jest.mock("../redux/actions/playlistActions", () => ({
  doPlaylistsRequesting: jest.fn()
}));

const wrapper = mount(
  <Provider store={store}>
    <Router>
      <PlaylistsContainer playlists={initialState.playlists} />
    </Router>
  </Provider>
);

describe("PlaylistlistContainer", () => {
  it("renders PlaylistCards", () => {
    wrapper.find(PlaylistCards);
  });
});
