import React from "react";
import toJson from "enzyme-to-json";
import { Provider } from "react-redux";
import AddIcon from "@material-ui/icons/Add";
import CheckIcon from "@material-ui/icons/Check";
import Movie from "./Movie";
import Typography from "@material-ui/core/Typography";
import {
  doPlaylistAddMovieRequesting,
  doPlaylistRemoveMovieRequesting
} from "../redux/actions/playlistActions";

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
