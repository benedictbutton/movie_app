import {
  RATINGS_REQUESTING,
  RATING_ADD,
  RATINGS_REMOVE
} from "../constants/actionTypes";

const doRatingsRequesting = values => ({
  type: RATINGS_REQUESTING,
  values
});

const doRatingAdd = event => ({
  type: RATING_ADD,
  event
});

const doRatingsRemove = () => ({
  type: RATINGS_REMOVE
});

export { doRatingsRequesting, doRatingAdd, doRatingsRemove };
