import {
  MOVIES_REQUESTING,
  MY_MOVIES_REQUESTING,
  MOVIE_SEARCH_REQUESTING,
  MOVIE_CATEGORY_REQUESTING,
  CAST_REQUESTING,
  MOVIE_POSTING,
  FILTER_MOVIE_RATINGS,
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

const doCastRequesting = (id, mediaType) => ({
  type: CAST_REQUESTING,
  id,
  mediaType
});

const doMoviePosting = (rating, movie) => ({
  type: MOVIE_POSTING,
  movie: movie,
  score: rating.currentTarget.value
});

const doFilterMovieRatings = filter => ({
  type: FILTER_MOVIE_RATINGS,
  filter: filter
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
  doCastRequesting,
  doMoviePosting,
  doFilterMovieRatings,
  doUpdateGenre,
  doUpdateSearch
};
