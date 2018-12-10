import React, { Component } from "react";
import { connect } from "react-redux";
import { Redirect, withRouter } from "react-router-dom";
import { reduxForm, Field } from "redux-form";
import FormInput from "../components/FormInput";
import { doSignUpRequesting } from "../redux/actions/formActions";
import {
  required,
  maxLength,
  maxLength15,
  minLength,
  minLength5,
  minLength7,
  email,
  alphaNumeric,
  passwordLowercase,
  passwordUppercase,
  passwordNumber,
  passwordsMatch
} from "../util/validations";
//material-ui
import AssignmentIcon from "@material-ui/icons/Assignment";
import Avatar from "@material-ui/core/Avatar";
import Grid from "@material-ui/core/Grid";
import Button from "@material-ui/core/Button";
import Icon from "@material-ui/core/Icon";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  layout: {
    width: "auto",
    marginLeft: theme.spacing.unit * 2,
    marginRight: theme.spacing.unit * 2,
    [theme.breakpoints.up(600 + theme.spacing.unit * 2 * 2)]: {
      width: 600,
      marginLeft: "auto",
      marginRight: "auto"
    }
  },
  paper: {
    marginTop: theme.spacing.unit * 3,
    marginBottom: theme.spacing.unit * 3,
    padding: theme.spacing.unit * 2,
    [theme.breakpoints.up(600 + theme.spacing.unit * 3 * 2)]: {
      marginTop: theme.spacing.unit * 6,
      marginBottom: theme.spacing.unit * 6,
      padding: theme.spacing.unit * 3
    }
  },
  grid: {
    marginTop: theme.spacing.unit * 3
  },
  rightIcon: {
    marginLeft: theme.spacing.unit
  },
  avatar: {
    margin: theme.spacing.unit,
    backgroundColor: theme.palette.secondary.main
  }
});

class SignUpContainer extends Component {
  render() {
    const {
      handleSubmit,
      pristine,
      submitting,
      valid,
      client: { requesting, successful, messages, errors, display },
      classes
    } = this.props;

    if (this.props.client.successful) {
      return <Redirect to="/ms/movies" />;
    }
    return (
      <>
        <main className={classes.layout}>
          <Paper className={classes.paper}>
            <Grid container spacing={24} justify="center">
              <Grid item xs={4} align="center">
                <Avatar className={classes.avatar}>
                  <AssignmentIcon />
                </Avatar>
                <Typography
                  component="h1"
                  variant="h5"
                  align="center"
                  gutterbottom
                >
                  Sign Up
                </Typography>
              </Grid>
            </Grid>
            <form onSubmit={handleSubmit} noValidate autoComplete="off">
              <Grid container spacing={24}>
                <Grid item xs={12}>
                  <Field
                    name="firstName"
                    type="text"
                    component={FormInput}
                    label="First Name"
                    autofocus
                  />
                </Grid>
                <Grid item xs={12}>
                  <Field
                    name="lastName"
                    type="text"
                    component={FormInput}
                    label="Last Name"
                  />
                </Grid>
                <Grid item xs={12}>
                  <Field
                    name="username"
                    type="text"
                    component={FormInput}
                    label="Username"
                    validate={[required, maxLength15, minLength5]}
                    warn={alphaNumeric}
                  />
                </Grid>
                <Grid item xs={12}>
                  <Field
                    name="email"
                    type="text"
                    component={FormInput}
                    label="Email"
                    validate={[required, email]}
                  />
                </Grid>
                <Grid item xs={12}>
                  <Field
                    name="password"
                    type="password"
                    component={FormInput}
                    label="Password"
                    validate={[
                      required,
                      passwordLowercase,
                      passwordUppercase,
                      passwordNumber,
                      minLength7,
                      maxLength15
                    ]}
                  />
                </Grid>
                <Grid item xs={12}>
                  <Field
                    name="passwordConfirmation"
                    type="password"
                    component={FormInput}
                    label="Confirm Password"
                    validate={[required, passwordsMatch]}
                  />
                </Grid>
                <Grid container justify="flex-end" alignItems="flex-end">
                  <Grid item xs={3} className={classes.grid}>
                    <Button
                      color="primary"
                      variant="contained"
                      type="submit"
                      disabled={!valid || pristine || submitting}
                      className={classes.button}
                    >
                      Submit
                    </Button>
                  </Grid>
                </Grid>
              </Grid>
            </form>
          </Paper>
        </main>
      </>
    );
  }
}

const signUpForm = {
  form: `signup`,
  onSubmit: doSignUpRequesting
};

const mapStateToProps = state => ({
  client: state.client
});

SignUpContainer = reduxForm(signUpForm)(SignUpContainer);
export default withRouter(
  connect(
    mapStateToProps,
    { onSubmit: doSignUpRequesting }
  )(withStyles(styles)(SignUpContainer))
);
