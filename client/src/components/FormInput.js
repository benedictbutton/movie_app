import React from "react";

//material-ui
import TextField from "@material-ui/core/TextField";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  textField: {
    marginLeft: theme.spacing.unit,
    marginRight: theme.spacing.unit,
    width: 500
  }
});

const FormInput = props => {
  const { classes } = props;
  return (
    <TextField
      id={props.id}
      label={props.label}
      name={props.input.name}
      className={classes.textField}
      margin="normal"
      variant="filled"
      {...props.input}
    />
  );
};

export default withStyles(styles)(FormInput);
