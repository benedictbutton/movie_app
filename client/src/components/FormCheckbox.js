import React from "react";
// material-ui
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Checkbox from "@material-ui/core/Checkbox";

const FormCheckbox = props => {
  const { input } = props;
  return (
    <FormControlLabel
      control={
        <Checkbox
          checked={input.value ? false : true}
          onChange={input.onChange}
          color="primary"
        />
      }
      label="Make default watchlist?"
    />
  );
};

export default FormCheckbox;
