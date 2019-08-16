import {
  RATINGS_REQUESTING,
  RATINGS_SUCCESS,
  RATING_REMOVE_REQUESTING,
  RATING_REMOVE_SUCCESS,
  RATINGS_ERROR,
  RATING_ADD,
  TOGGLE_DISPLAY
} from "../constants/actionTypes";

const id = "id";
const INITIAL_STATE = {
  list: {
    [id]: { stars: ["white", "white", "white", "white", "white"], score: 0 }
  },
  requesting: false,
  successful: false,
  notifications: {}
};

const applyRatingsRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyRatingsSuccess = (state, action) => {
  let ratings = action.responseJson.entities.rating;
  return {
    ...state,
    list: { ...state.list, ...ratings },
    requesting: false,
    successful: true
  };
};

const applyRatingRemoveRequesting = (state, action) => ({
  ...state,
  requesting: true,
  successful: false
});

const applyRatingRemoveSuccess = (state, action) => {
  let movieId = action.responseJson.movieId;
  // const { [parentKey]: parentValue, ...noChild } = deep;
  const { list: parentValue, ...noChild } = state;
  // const { [childKey]: removedValue, ...childWithout } = parentValue;
  const { [movieId]: removedValue, ...childWithout } = parentValue;
  // const withoutThird = { ...noChild, [parentKey]: childWithout };
  const withoutRating = {
    ...noChild,
    list: childWithout,
    requesting: false,
    successful: true
  };
  return {
    ...state,
    ...withoutRating
  };
};

const applyRatingsError = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: action.error,
    message: `${action.error.message}` || "something went wrong",
    code: action.error.code,
    display: true
  },
  requesting: false,
  successful: false
});

const applyToggleDisplay = (state, action) => ({
  ...state,
  notifications: {
    ...state.notifications,
    body: "",
    message: "",
    code: null,
    display: false
  }
});

const applyRatingAdd = (state, action) => {
  let rating = parseInt(action.event.currentTarget.value, 10) + 1;
  let newStars = [0, 1, 2, 3, 4].map((star, index) => {
    if (index < rating) {
      star = "yellow";
      return star;
    }
    return "white";
  });
  return {
    ...state,
    list: {
      ...state.list,
      [action.event.currentTarget.id]: {
        ...state.list[action.event.currentTarget.id],
        score: rating,
        stars: newStars
      }
    }
  };
};

function ratingsReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case RATINGS_REQUESTING:
      return applyRatingsRequesting(state, action);
    case RATINGS_SUCCESS:
      return applyRatingsSuccess(state, action);
    case RATING_REMOVE_REQUESTING:
      return applyRatingRemoveRequesting(state, action);
    case RATING_REMOVE_SUCCESS:
      return applyRatingRemoveSuccess(state, action);
    case RATINGS_ERROR:
      return applyRatingsError(state, action);
    case TOGGLE_DISPLAY:
      return applyToggleDisplay(state);
    case RATING_ADD:
      return applyRatingAdd(state, action);

    default:
      return state;
  }
}

export default ratingsReducer;
