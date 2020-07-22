import React from "react";
import { connect } from "react-redux";
import { doMoviePosting } from "../redux/actions/movieActions";
import { doRatingAdd } from "../redux/actions/ratingActions";
import { getRatings } from "../redux/selectors/selectors";
//material-ui
import Grid from "@material-ui/core/Grid";
import IconButton from "@material-ui/core/IconButton";
import StarIcon from "@material-ui/icons/Star";
import StarIconBorder from "@material-ui/icons/StarBorder";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  icon: {
    flex: 1,
    padding: theme.spacing.unit * 1
  },
  grid: {
    flex: 1
  }
});

const Stars = props => {
  const { id, classes } = props;
  let movieRating = props.ratings.list[id] || {
    stars: ["white", "white", "white", "white", "white"],
    score: 0
  };

  let stars = movieRating.stars.map((el, index) => {
    return (
      <Grid item key={index}>
        <IconButton
          id={id}
          value={index}
          className={classes.icon}
          onClick={event => {
            props.doRatingAdd(event);
            props.doMoviePosting(event, id, props.movie);
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
      </Grid>
    );
  });
  return (
    <Grid
      container
      className={classes.grid}
      alignItems="center"
      justify="space-evenly"
    >
      {stars}
    </Grid>
  );
};

const mapStateToProps = (state, props) => ({
  ratings: getRatings(state)
});

export default connect(
  mapStateToProps,
  { doRatingAdd, doMoviePosting }
)(withStyles(styles)(Stars));
