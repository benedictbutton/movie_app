import {
  RATINGS_REQUESTING,
  RATINGS_SUCCESS,
  RATINGS_ERROR,
  RATING_ADD,
  RATINGS_REMOVE
} from "../constants/actionTypes";

let id = "id";
const INITIAL_STATE = {
  list: {
    [id]: { stars: ["white", "white", "white", "white", "white"], score: 0 }
  },
  requesting: false,
  successful: false,
  errors: [],
  messages: ""
};

const applyRatingsRequesting = (action, state) => ({
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

const applyRatingsError = (state, action) => ({
  ...state,
  errors: [
    ...state.errors,
    {
      body: action.error,
      time: new Date()
    }
  ],
  messages: [],
  requesting: false,
  successful: false
});

const applyRatingAdd = (state, action) => {
  let rating = action.event.currentTarget.value.toString();
  let newStars = [0, 1, 2, 3, 4].map((star, index) => {
    if (index <= rating) {
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
    case RATINGS_ERROR:
      return applyRatingsError(state, action);
    case RATING_ADD:
      return applyRatingAdd(state, action);
    case RATINGS_REMOVE:
      return INITIAL_STATE;

    default:
      return state;
  }
}

export default ratingsReducer;
