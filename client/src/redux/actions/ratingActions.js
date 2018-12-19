import { RATING_ADD } from "../constants/actionTypes";

const doRatingAdd = event => ({
  type: RATING_ADD,
  event
});

export { doRatingAdd };
