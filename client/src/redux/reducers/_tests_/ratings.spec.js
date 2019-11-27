import ratingsReducer from "../ratings.js";
import {
  RATINGS_REQUESTING,
  RATINGS_SUCCESS,
  RATING_REMOVE_REQUESTING,
  RATING_REMOVE_SUCCESS,
  RATINGS_ERROR,
  RATING_ADD,
  TOGGLE_DISPLAY
} from "../../constants/actionTypes";

const id = "id";
describe("ratings reducer", () => {
  it("return default state", () => {
    expect(ratingsReducer(undefined, {})).toEqual({
      list: {
        [id]: { stars: ["white", "white", "white", "white", "white"], score: 0 }
      },
      requesting: false,
      successful: false,
      notifications: {}
    });
  });

  it("should handle RATINGS_SUCCESS", () => {
    expect(
      ratingsReducer(undefined, {
        type: RATINGS_SUCCESS,
        responseJson: {
          entities: {
            rating: {
              "11": {
                id: 39,
                user_id: 2,
                movie_id: 11,
                score: 5,
                stars: ["yellow", "yellow", "yellow", "yellow", "yellow"],
                created_at: "2019-03-29T20:21:34.449Z"
              },
              "13": {
                id: 719,
                user_id: 2,
                movie_id: 13,
                score: 5,
                stars: ["yellow", "yellow", "yellow", "yellow", "yellow"],
                created_at: "2019-10-19T02:02:15.721Z"
              },
              "14": {
                id: 266,
                user_id: 2,
                movie_id: 14,
                score: 3,
                stars: ["yellow", "yellow", "yellow", "white", "white"],
                created_at: "2019-05-25T05:26:41.962Z"
              }
            }
          }
        }
      })
    ).toEqual({
      list: {
        id: { stars: ["white", "white", "white", "white", "white"], score: 0 },
        "11": {
          id: 39,
          user_id: 2,
          movie_id: 11,
          score: 5,
          stars: ["yellow", "yellow", "yellow", "yellow", "yellow"],
          created_at: "2019-03-29T20:21:34.449Z"
        },
        "13": {
          id: 719,
          user_id: 2,
          movie_id: 13,
          score: 5,
          stars: ["yellow", "yellow", "yellow", "yellow", "yellow"],
          created_at: "2019-10-19T02:02:15.721Z"
        },
        "14": {
          id: 266,
          user_id: 2,
          movie_id: 14,
          score: 3,
          stars: ["yellow", "yellow", "yellow", "white", "white"],
          created_at: "2019-05-25T05:26:41.962Z"
        }
      },
      requesting: false,
      successful: true,
      notifications: {}
    });
  });
});
