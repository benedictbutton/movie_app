import React from "react";
// material-ui
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flex: 1
  },
  type: {
    color: "#ecca00",
    fontWeight: 700,
    marginBottom: theme.spacing.unit
  }
});

const PersonCard = props => {
  const { classes, firstName, lastName, profileImage } = props;

  return (
    <div className={classes.root}>
      <img
        src={profileImage}
        alt="picture of cast member"
        width="75%"
        height="50%"
      />
      <Typography noWrap variant="headline" className={classes.type}>
        {firstName}
      </Typography>
      <Typography noWrap variant="headline" className={classes.type}>
        {lastName}
      </Typography>
    </div>
  );
};

export default withStyles(styles)(PersonCard);
