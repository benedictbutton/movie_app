import React from "react";
import { Link, withRouter } from "react-router-dom";
import MovieContainer from "../containers/MovieContainer";

const MovieCard = props => {
  const { title, imageUrl, overview } = props;
  return (
    <Link
      to={{
        pathname: `/ms/movie/${props.id}`,
        state: {
          title: title,
          imageUrl: imageUrl,
          overview: overview
        }
      }}
    >
      <img src={imageUrl} alt="test" width="100%" height="100%" />
    </Link>
  );
};

export default withRouter(MovieCard);
