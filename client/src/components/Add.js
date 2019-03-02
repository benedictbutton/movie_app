import React from "react";
//material=ui
import Grid from "@material-ui/core/Grid";
import IconButton from "@material-ui/core/IconButton";
import AddIcon from "@material-ui/icons/Add";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  button: {
    "&:hover": {
      backgroundColor: "transparent"
    },
    paddingRight: 0,
    paddingTop: 0,
    marginTop: 0
  },
  icon: {
    background: "rgba(0, 0, 0, 0.5)",
    color: "white",
    marginLeft: theme.spacing.unit * 4
  }
});

const Add = props => {
  const { classes } = props;
  return (
    <Grid item align="right">
      <IconButton className={classes.button} align="right">
        <AddIcon
          className={classes.icon}
          align="right"
          style={{ fontSize: 30 }}
        />
      </IconButton>
    </Grid>
  );
};

export default withStyles(styles)(Add);
