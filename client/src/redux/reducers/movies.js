import {
  MOVIES_REQUESTING,
  MOVIES_SUCCESS,
  MOVIES_ERROR
} from "../constants/actionTypes";

const INITIAL_STATE = {
  list: {},
  requesting: false,
  successful: false,
  errors: [],
  messages: "",
  query: "Drama"
};

const applyMoviesRequesting = (state, action) => ({
  ...state,
  requesting: true,
  query: action.payload
});

const applyMoviesSuccess = (state, action) => ({
  ...state,
  list: action.responseJson.entities.movies,
  requesting: false,
  successful: true
});

const applyMoviesError = (state, action) => ({
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

function moviesReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case MOVIES_REQUESTING:
      return applyMoviesRequesting(state, action);
    case MOVIES_SUCCESS:
      return applyMoviesSuccess(state, action);
    case MOVIES_ERROR:
      return applyMoviesError(state, action);

    default:
      return state;
  }
}

export default moviesReducer;
