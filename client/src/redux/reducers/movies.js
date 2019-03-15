import {
  MOVIES_REQUESTING,
  MOVIES_SUCCESS,
  MY_MOVIES_REQUESTING,
  MY_MOVIES_SUCCESS,
  MOVIE_SEARCH_REQUESTING,
  MOVIE_SEARCH_SUCCESS,
  MOVIES_ERROR,
  UPDATE_GENRE,
  TOGGLE_DISPLAY
} from "../constants/actionTypes";

const INITIAL_STATE = {
  results: [],
  list: {},
  ratedList: {},
  searchList: {},
  requesting: false,
  successful: false,
  notifications: {},
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

/*The Set data structure ensures that when navigating from Ratings to Movies, duplicate movie entries are not saved in state since both routes rely on it for displaying movies*/
const applyMoviesSuccess = (state, action) => {
  const { movies } = action.responseJson.entities;
  const newResults = Object.keys(movies);
  return {
    ...state,
    results: [...new Set([...state.results, ...newResults])],
    list: { ...state.list, ...action.responseJson.entities.movies },
    requesting: false,
    successful: true
  };
};

const applyMyMoviesRequesting = (state, action) => ({
  ...state,
  requesting: true
});

const applyMyMoviesSuccess = (state, action) => ({
  ...state,
  ratedList: action.responseJson.entities.movies,
  requesting: false,
  successful: true
});

const applyMovieSearchRequesting = (state, action) => ({
  ...state,
  requesting: true
});

const applyMovieSearchSuccess = (state, action) => {
  if (Boolean(action.responseJson.entities.lists) === false) {
    const results = [];
    return {
      ...state,
      searchList: { ...state.searchList, results },
      notifications: {
        message: `No results`,
        code: null,
        display: true
      }
    };
  }
  return {
    ...state,
    searchList: action.responseJson.entities.lists,
    requesting: false,
    successful: true
  };
};

const applyMoviesError = (state, action) => ({
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
    case MOVIE_SEARCH_REQUESTING:
      return applyMovieSearchRequesting(state, action);
    case MOVIE_SEARCH_SUCCESS:
      return applyMovieSearchSuccess(state, action);
    case MOVIES_ERROR:
      return applyMoviesError(state, action);
    case TOGGLE_DISPLAY:
      return applyToggleDisplay(state);
    case UPDATE_GENRE:
      return applyUpdateGenre(state, action);

    default:
      return state;
  }
}

export default moviesReducer;
