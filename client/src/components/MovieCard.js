import React from "react";
import { Link, withRouter } from "react-router-dom";
//material-ui
import GridListTileBar from "@material-ui/core/GridListTileBar";
import MovieContainer from "../containers/MovieContainer";
import Stars from "../components/Stars";
import StarsContainer from "../containers/StarsContainer";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  titleBar: {
    background:
      "linear-gradient(to bottom, rgba(0,0,0,0.7) 0%, " +
      "rgba(0,0,0,0.3) 70%, rgba(0,0,0,0) 100%)"
  }
});

const MovieCard = props => {
  const { classes, title, imageUrl, overview, width, ...rest } = props;

  const starSize = {
    xs: 20,
    lg: 18
  };

  return (
    <>
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
        <img
          src={imageUrl}
          alt="test"
          width="100%"
          height="100%"
          onMouseEnter={props.handleMouseEnter}
          onMouseLeave={props.handleMouseLeave}
        />
      </Link>
      <StarsContainer
        actionPosition="left"
        actionIcon={<Stars starSize={starSize[width]} />}
        starsVisible={props.starsVisible}
      />
    </>
  );
};

export default withRouter(withWidth()(withStyles(styles)(MovieCard)));
