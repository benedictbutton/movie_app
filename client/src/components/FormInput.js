import React from "react";
//material-ui
import TextField from "@material-ui/core/TextField";

const FormInput = props => {
  return (
    <TextField
      id={props.id}
      type={props.type}
      label={props.label}
      name={props.input.name}
      fullWidth
      {...props.input}
    />
  );
};

export default FormInput;
