import React from "react";
// material-ui
import Grid from "@material-ui/core/Grid";
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

const StarList = props => {
  const { classes, rating } = props;
  let starRating = parseInt(rating, 10);

  const stars = ["white", "white", "white", "white", "white"];

  let selection = stars.map((el, index) => {
    return (
      <Grid item key={index}>
        {index + 1 <= starRating ? (
          <StarIcon id={index} style={{ color: "yellow" }} />
        ) : (
          <StarIconBorder id={index} style={{ color: el }} />
        )}
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
      {selection}
    </Grid>
  );
};

export default withStyles(styles)(StarList);
