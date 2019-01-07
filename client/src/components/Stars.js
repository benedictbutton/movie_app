import React from "react";
import { connect } from "react-redux";
import { doMoviePosting } from "../redux/actions/movieActions";
import { getMoviesAsIds, getRatings } from "../redux/selectors/selectors";
//material-ui
import IconButton from "@material-ui/core/IconButton";
import StarIcon from "@material-ui/icons/Star";
import StarIconBorder from "@material-ui/icons/StarBorder";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  icon: {
    flex: 1
  }
});

const Stars = props => {
  const { id, classes, handleRating } = props;
  let movieRating = props.ratings.list[id] || {
    stars: ["white", "white", "white", "white", "white"],
    score: 0
  };
  let stars = movieRating.stars.map((el, index) => {
    return (
      <IconButton
        key={index}
        id={id}
        value={index}
        className={classes.icon}
        onClick={event => {
          handleRating(event);
          props.doMoviePosting(event, props.movie);
        }}
      >
        {el === "white" ? (
          <StarIconBorder
            id={index}
            style={{ color: el, fontSize: props.starSize }}
          />
        ) : (
          <StarIcon
            id={index}
            style={{ color: el, fontSize: props.starSize }}
          />
        )}
      </IconButton>
    );
  });
  return <div className={classes.root}>{stars}</div>;
};

const mapStateToProps = (state, props) => ({
  ratings: getRatings(state),
  movie: getMoviesAsIds(state, props.id)
});

export default connect(
  mapStateToProps,
  { doMoviePosting }
)(withStyles(styles)(Stars));
