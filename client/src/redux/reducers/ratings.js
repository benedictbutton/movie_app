import { RATING_ADD } from "../constants/actionTypes";

let id = "id";
const INITIAL_STATE = {
  [id]: { stars: ["white", "white", "white", "white", "white"], score: 0 }
};

const applyRatingAdd = (state, action) => {
  debugger;
  let rating = action.event.currentTarget.value.toString();
  let newStars = state.id.stars.map((star, index) => {
    if (index <= rating) {
      star = "yellow";
      return star;
    }
    return star;
  });
  debugger;

  return {
    ...state,
    [action.event.currentTarget.id]: {
      ...state[action.event.currentTarget.id],
      score: rating,
      stars: newStars
    }
  };
};

function ratingsReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case RATING_ADD:
      return applyRatingAdd(state, action);

    default:
      return state;
  }
}

export default ratingsReducer;
