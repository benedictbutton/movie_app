import React from "react";
//material-ui
import TextField from "@material-ui/core/TextField";

const FormInput = props => {
  const { touched, error } = props.meta;

  return (
    <TextField
      id={props.id}
      type={props.type}
      label={props.label}
      name={props.input.name}
      fullWidth
      {...props.input}
      helperText={
        touched && (error && <span style={{ color: "red" }}>{error}</span>)
      }
      margin="dense"
    />
  );
};

export default FormInput;
