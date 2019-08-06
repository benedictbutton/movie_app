import {
  MOVIES_REQUESTING,
  MOVIES_SUCCESS,
  MY_MOVIES_REQUESTING,
  MY_MOVIES_SUCCESS,
  MOVIE_SEARCH_REQUESTING,
  MOVIE_CATEGORY_REQUESTING,
  MOVIE_CATEGORY_SUCCESS,
  MOVIE_SEARCH_SUCCESS,
  MOVIES_ERROR,
  FILTER_MOVIE_RATINGS,
  UPDATE_GENRE,
  UPDATE_SEARCH,
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
  query: { type: "discover", page: 0, tag: "18" },
  filter: "all"
};

const applyMoviesRequesting = (state, action) => ({
  ...state,
  requesting: true,
  query: {
    ...state.query,
    type: action.payload.type,
    page: action.payload.page,
    tag: action.payload.tag
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

const applyMyMoviesSuccess = (state, action) => {
  let movies = action.responseJson.entities.movies;
  const renameKeys = (keysMap, obj) =>
    Object.keys(obj).reduce(
      (acc, key) => ({
        ...acc,
        ...{ [keysMap[key] || key]: obj[key] }
      }),
      {}
    );

  const newObj = {};
  for (let key in movies) {
    newObj[key] = renameKeys({ description: "overview" }, movies[key]);
  }

  return {
    ...state,
    ratedList: newObj,
    requesting: false,
    successful: true
  };
};

const applyMovieSearchRequesting = (state, action) => ({
  ...state,
  query: {
    ...state.query,
    type: action.query.type,
    page: action.query.page,
    tag: action.query.tag
  },
  requesting: true
});

const applyMovieSearchSuccess = (state, action) => {
  if (Boolean(action.responseJson.entities.lists) === false) {
    return {
      ...state,
      notifications: {
        message: `No results`,
        code: null,
        display: true
      }
    };
  }

  return {
    ...state,
    results: action.responseJson.result,
    list: { ...state.list, ...action.responseJson.entities.lists },
    requesting: false,
    successful: true
  };
};

const applyMovieCategoryRequesting = (state, action) => ({
  ...state,
  requesting: true,
  query: {
    ...state.query,
    type: action.query.type,
    page: action.query.page,
    tag: action.query.tag
  }
});

const applyMovieCategorySuccess = (state, action) => {
  const movies = action.responseJson.entities.lists;
  const movieIds = action.responseJson.result;
  return {
    ...state,
    results: [...new Set([...state.results, ...movieIds])],
    list: { ...state.list, ...movies },
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

const applyFilterMovieRatings = (state, action) => ({
  ...state,
  filter: action.filter
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
  query: {
    ...state.query,
    page: 0
  }
});

const applyUpdateSearch = (state, action) => ({
  ...state,
  results: [],
  query: {
    ...state.query,
    type: action.query.type,
    page: action.query.page,
    tag: action.query.tag
  }
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
    case MOVIE_CATEGORY_REQUESTING:
      return applyMovieCategoryRequesting(state, action);
    case MOVIE_CATEGORY_SUCCESS:
      return applyMovieCategorySuccess(state, action);
    case MOVIES_ERROR:
      return applyMoviesError(state, action);
    case FILTER_MOVIE_RATINGS:
      return applyFilterMovieRatings(state, action);
    case TOGGLE_DISPLAY:
      return applyToggleDisplay(state);
    case UPDATE_GENRE:
      return applyUpdateGenre(state, action);
    case UPDATE_SEARCH:
      return applyUpdateSearch(state, action);

    default:
      return state;
  }
}

export default moviesReducer;
