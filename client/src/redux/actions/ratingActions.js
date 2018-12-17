import { RATINGS_TOGGLE } from "../constants/actionTypes";

const doRatingsToggle = event => ({
  type: RATINGS_TOGGLE,
  event
});

export { doRatingsToggle };
