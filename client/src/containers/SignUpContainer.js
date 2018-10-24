import React, { Component } from "react";
import { connect } from "react-redux";
import { reduxForm, Field } from "redux-form";
import FormInput from "../components/FormInput";
import { doSignUpForm } from "../redux/actions/formActions";
//material-ui
import Button from "@material-ui/core/Button";
import Icon from "@material-ui/core/Icon";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  container: {
    display: "flex",
    flexWrap: "wrap",
    backgroundColor: "white"
  },
  button: {
    margin: theme.spacing.unit
  },
  rightIcon: {
    marginLeft: theme.spacing.unit
  }
});

class SignUpContainer extends Component {
  render() {
    const { handleSubmit, classes } = this.props;

    return (
      <form
        onSubmit={handleSubmit}
        className={classes.container}
        noValidate
        autoComplete="off"
      >
        <Field
          name="firstName"
          type="text"
          component={FormInput}
          label="First Name"
        />

        <Field
          name="lastName"
          type="text"
          component={FormInput}
          label="Last Name"
        />

        <Field name="email" type="text" component={FormInput} label="Email" />

        <Field
          name="password"
          type="password"
          component={FormInput}
          label="Password"
        />

        <Button
          variant="contained"
          color="primary"
          className={classes.button}
          type="submit"
        >
          Send
          <Icon className={classes.rightIcon}>send</Icon>
        </Button>
      </form>
    );
  }
}

const signUpForm = {
  form: `signup`,
  onSubmit: doSignUpForm
};

SignUpContainer = reduxForm(signUpForm)(SignUpContainer);
export default connect(
  undefined,
  { onSubmit: doSignUpForm }
)(withStyles(styles)(SignUpContainer));
