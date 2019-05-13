import {
  RATINGS_REQUESTING,
  RATING_REMOVE_REQUESTING,
  RATING_ADD,
  RATINGS_REMOVE
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

const doRatingsRemove = () => ({
  type: RATINGS_REMOVE
});

export {
  doRatingsRequesting,
  doRatingRemoveRequesting,
  doRatingAdd,
  doRatingsRemove
};
