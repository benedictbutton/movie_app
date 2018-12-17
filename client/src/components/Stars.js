import React from "react";
//material-ui
// import GridListTileBar from "@material-ui/core/GridListTileBar";
import IconButton from "@material-ui/core/IconButton";
import StarBorderIcon from "@material-ui/icons/StarBorder";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  icon: {
    flex: 1,
    color: "white"
  }
});

const Stars = props => {
  const { classes } = props;
  let stars = [0, 1, 2, 3, 5].map(el => {
    return (
      <IconButton key={el} className={classes.icon}>
        <StarBorderIcon style={{ fontSize: props.starSize }} />
      </IconButton>
    );
  });
  return <div className={classes.root}>{stars}</div>;
};

export default withStyles(styles)(Stars);
