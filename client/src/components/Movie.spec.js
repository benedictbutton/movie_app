import React from "react";
import renderer from "react-test-renderer";
import toJson from "enzyme-to-json";
import configureStore from "redux-mock-store";
import createSagaMiddleware from "redux-saga";
import { Provider } from "react-redux";
import { BrowserRouter as Router, MemoryRouter, Link } from "react-router-dom";
import App from "../App";
import AddIcon from "@material-ui/icons/Add";
import CheckIcon from "@material-ui/icons/Check";
import Movie from "./Movie";
import Typography from "@material-ui/core/Typography";
import {
  doPlaylistAddMovieRequesting,
  doPlaylistRemoveMovieRequesting
} from "../redux/actions/playlistActions";

const initialState = {
  client: {
    requesting: false,
    successful: false,
    admin: false,
    reset: false,
    notifications: { message: "test" }
  },
  user: {
    profile: {
      id: 7,
      firstName: "test",
      lastName: "user",
      username: "testuser",
      email: "testuser@email.com"
    },
    requesting: false,
    successful: false,
    notifications: {
      body: null,
      message: "test",
      code: 404,
      display: true
    }
  },
  movies: {
    results: [],
    list: {},
    cast: [],
    ratedList: {},
    searchList: {},
    requesting: false,
    successful: false,
    notifications: {},
    query: { type: "multi", page: 1, tag: "movie/popular" },
    filter: "all"
  },
  playlists: {
    active: 1,
    lists: [
      {
        active: true,
        id: 0,
        name: "Gremlins Documentary",
        user_id: 2
      }
    ],
    playlistMovieIds: { ["none"]: [], "1": [0] },
    playlistMovies: {},
    requesting: false,
    successful: false,
    notifications: {}
  }
};

const props = {
  movie: { id: 0, overview: "The never told before, true story of Gremlins" },
  profile: false,
  cast: [
    { id: 1, name: "Bill Burr" },
    { id: 2, name: "Emma Stone" },
    { id: 3, name: "Will Ferrell" }
  ],
  imageUrl: "https://image.tmdb.org/t/p/w500/BbNvKCuEF4SRzFXR16aK6ISFtR.jpg",
  check: true,
  activePlaylist: 1,
  handlePlaylistClick: jest.fn(() =>
    doPlaylistRemoveMovieRequesting(this.check, this.activePlaylist, this.movie)
  )
};

describe("Movie", () => {
  beforeEach(() => jest.resetAllMocks());

  test("renders consistently", () => {
    const wrapper = shallow(<Movie {...props} />);
    const component = wrapper.dive();
    expect(toJson(component)).toMatchSnapshot();
    wrapper.unmount();
  });

  it("render()", () => {
    const wrapper = shallow(<Movie {...props} />).dive();
    expect(wrapper.exists()).toBe(true);
    expect(wrapper.contains(<CheckIcon />)).toBe(true);
    expect(wrapper.contains(<AddIcon />)).toBe(false);
    wrapper.find("#btn").simulate("click");
    expect(props.handlePlaylistClick).toHaveBeenCalled();
    wrapper.setProps({ check: false });
    expect(wrapper.contains(<AddIcon />)).toBe(true);
    expect(
      wrapper
        .find(Typography)
        .at(3)
        .dive()
        .dive()
        .text()
    ).toBe("Bill Burr");

    wrapper.unmount();
  });
});
// expect(handlePlaylistClick()).toHaveBeenCalled(1);
