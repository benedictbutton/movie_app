import React from "react";
import classNames from "classnames";
import { withStyles } from "@material-ui/core/styles";

export const styles = theme => ({
  /* Styles applied to the root element. */
  root: {
    position: "absolute",
    left: 0,
    right: 0,
    height: 48,
    background: "rgba(0, 0, 0, 0.5)",
    flex: 1
  },
  /* Styles applied to the root element if `titlePosition="bottom"`. */
  titlePositionBottom: {
    bottom: 0
  }
});

const StarsContainer = props => {
  const {
    starsVisible,
    actionIcon,
    actionPosition,
    classes,
    className: classNameProp,
    titlePosition
  } = props;

  const className = classNames(classes.root, {
    [classes.titlePositionBottom]: titlePosition === "bottom"
  });

  return (
    <div>
      {actionIcon && starsVisible ? (
        <div className={className}>
          <div>{actionIcon}</div>
        </div>
      ) : null}
    </div>
  );
};

StarsContainer.defaultProps = {
  actionPosition: "right",
  titlePosition: "bottom"
};

export default withStyles(styles, { name: "MuiGridListTileBar" })(
  StarsContainer
);
