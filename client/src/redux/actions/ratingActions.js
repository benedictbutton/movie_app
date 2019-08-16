import {
  RATINGS_REQUESTING,
  RATING_REMOVE_REQUESTING,
  RATING_ADD
} from "../constants/actionTypes";

const doRatingsRequesting = values => ({
  type: RATINGS_REQUESTING,
  values
});

const doRatingRemoveRequesting = (movieId, ratingId) => ({
  type: RATING_REMOVE_REQUESTING,
  movieId
});

const doRatingAdd = event => ({
  type: RATING_ADD,
  event
});

export { doRatingsRequesting, doRatingRemoveRequesting, doRatingAdd };
