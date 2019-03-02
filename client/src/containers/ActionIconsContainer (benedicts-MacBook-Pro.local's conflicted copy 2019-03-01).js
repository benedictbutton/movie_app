import React from "react";
import classNames from "classnames";
import Grid from "@material-ui/core/Grid";
import { withStyles } from "@material-ui/core/styles";

export const styles = theme => ({
  /* Styles applied to the root element. */
  grid: {
    position: "absolute",
    left: 0,
    right: 0,
    height: 48
  },
  root: {
    alignItems: "center"
  },
  /* Styles applied to the root element if `titlePosition="bottom"`. */
  titlePositionBottom: {
    background: "rgba(0, 0, 0, 0.5)",
    bottom: 0,
    alignItems: "center",
    justifyContent: "space-between"
  },
  /* Styles applied to the root element if `titlePosition="top"`. */
  titlePositionTop: {
    background: "transparent",
    top: 0,
    alignItems: "center"
  }
});

const ActionIconsContainer = props => {
  const {
    starsVisible,
    actionIcon,
    actionPosition,
    classes,
    className: classNameProp,
    titlePosition
  } = props;

  const className = classNames(classes.grid, {
    [classes.titlePositionBottom]: titlePosition === "bottom",
    [classes.titlePositionTop]: titlePosition === "top"
  });

  return (
    <div>
      {actionIcon && starsVisible ? (
        <Grid container className={classes.root}>
          <Grid item className={className}>
            {actionIcon}
          </Grid>
        </Grid>
      ) : null}
    </div>
  );
};

ActionIconsContainer.defaultProps = {
  actionPosition: "right",
  titlePosition: "bottom"
};

export default withStyles(styles, { name: "MuiGridListTileBar" })(
  ActionIconsContainer
);
