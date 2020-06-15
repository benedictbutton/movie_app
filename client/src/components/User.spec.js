import React from "react";
import renderer from "react-test-renderer";
import toJson from "enzyme-to-json";
import { initialState } from "../util/testData";
import User from "./User";

// console.log(wrapper.debug());

const wrapper = shallow(<User user={initialState.user} />);

describe("User", () => {
  beforeEach(() => jest.resetAllMocks());
  test("renders consistently", () => {
    const component = wrapper.dive();
    expect(toJson(component)).toMatchSnapshot();
  });

  it("render()", () => {
    expect(wrapper.exists()).toBe(true);
    expect(wrapper.props().user.profile.firstName).toEqual("test");
    wrapper.unmount();
  });
});
