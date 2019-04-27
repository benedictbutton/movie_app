import {
  MOVIES_REQUESTING,
  MY_MOVIES_REQUESTING,
  MOVIE_SEARCH_REQUESTING,
  MOVIE_CATEGORY_REQUESTING,
  MOVIE_POSTING,
  UPDATE_GENRE,
  UPDATE_SEARCH
} from "../constants/actionTypes";

const doMoviesRequesting = movies => ({
  type: MOVIES_REQUESTING,
  payload: movies
});

const doMyMoviesRequesting = () => ({
  type: MY_MOVIES_REQUESTING
});

const doMoviePosting = (rating, movie) => ({
  type: MOVIE_POSTING,
  movie: movie,
  score: rating.currentTarget.value
});

const doUpdateGenre = query => ({
  type: UPDATE_GENRE,
  query
});

const doUpdateSearch = query => ({
  type: UPDATE_SEARCH,
  query
});

const doMovieSearchRequesting = query => ({
  type: MOVIE_SEARCH_REQUESTING,
  query
});

const doMovieCategoryRequesting = query => ({
  type: MOVIE_CATEGORY_REQUESTING,
  query
});

export {
  doMoviesRequesting,
  doMyMoviesRequesting,
  doMovieSearchRequesting,
  doMovieCategoryRequesting,
  doMoviePosting,
  doUpdateGenre,
  doUpdateSearch
};
