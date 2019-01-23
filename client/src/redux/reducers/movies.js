import {
  MOVIES_REQUESTING,
  MOVIES_SUCCESS,
  MY_MOVIES_REQUESTING,
  MY_MOVIES_SUCCESS,
  MOVIES_ERROR,
  UPDATE_GENRE
} from "../constants/actionTypes";

const INITIAL_STATE = {
  results: [],
  list: {},
  requesting: false,
  successful: false,
  errors: [],
  messages: "",
  query: { page: 0, genre: "18" }
};

const applyMoviesRequesting = (state, action) => ({
  ...state,
  requesting: true,
  query: {
    ...state.query,
    page: action.payload.page,
    genre: action.payload.genre
  }
});

const applyMoviesSuccess = (state, action) => ({
  ...state,
  results: [
    ...state.results,
    ...action.responseJson.entities.lists.undefined.results
  ],
  list: { ...state.list, ...action.responseJson.entities.movies },
  requesting: false,
  successful: true
});

const applyMyMoviesRequesting = (state, action) => {
  // action.payload.pop();
  return {
    ...state,
    requesting: true
  };
};

const applyMyMoviesSuccess = (state, action) => ({
  ...state,
  results: action.responseJson.result,
  list: action.responseJson.entities.movies,
  requesting: false,
  success: true
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

const applyUpdateGenre = (state, action) => ({
  ...state,
  results: [],
  query: { ...state.query, page: 0, genre: action.query.genre }
});

function moviesReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case MOVIES_REQUESTING:
      return applyMoviesRequesting(state, action);
    case MOVIES_SUCCESS:
      return applyMoviesSuccess(state, action);
    case MY_MOVIES_REQUESTING:
      return applyMyMoviesRequesting(state, action);
    case MY_MOVIES_SUCCESS:
      return applyMyMoviesSuccess(state, action);
    case MOVIES_ERROR:
      return applyMoviesError(state, action);
    case UPDATE_GENRE:
      return applyUpdateGenre(state, action);

    default:
      return state;
  }
}

export default moviesReducer;
