import React from "react";
//material-ui
import classNames from "classnames";
import { withStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";

const styles = theme => ({
  container: {
    display: "flex",
    flexWrap: "wrap",
    backgroundColor: "white"
  },
  textField: {
    marginLeft: theme.spacing.unit,
    marginRight: theme.spacing.unit,
    width: 200
  }
});

const SignUp = props => {
  const { classes } = props;

  return (
    <form className={classes.container} noValidate autoComplete="off">
      <TextField
        id="filled-email-input"
        label="Email"
        className={classes.textField}
        type="email"
        name="email"
        autoComplete="email"
        margin="normal"
        variant="filled"
      />
    </form>
  );
};

export default withStyles(styles)(SignUp);
