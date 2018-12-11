import { MOVIES_REQUESTING } from "../constants/actionTypes";

const doMoviesRequesting = movies => ({
  type: MOVIES_REQUESTING,
  payload: movies
});

export { doMoviesRequesting };
