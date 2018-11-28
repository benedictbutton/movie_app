import React, { Component } from "react";
import { connect } from "react-redux";
import { Redirect, withRouter } from "react-router-dom";
import { reduxForm, Field } from "redux-form";
import FormInput from "../components/FormInput";
import { doSignUpForm } from "../redux/actions/formActions";
//material-ui
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
  }
});

class SignUpContainer extends Component {
  render() {
    const { handleSubmit, classes } = this.props;

    if (this.props.submitSucceeded) {
      return <Redirect to="/ms/movies" />;
    }
    return (
      <>
        <main className={classes.layout}>
          <Paper className={classes.paper}>
            <Grid container spacing={24}>
              <Grid item xs={4}>
                <Typography
                  component="h3"
                  variant="h4"
                  align="left"
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
                    name="email"
                    type="text"
                    component={FormInput}
                    label="Email"
                  />
                </Grid>
                <Grid item xs={12}>
                  <Field
                    name="password"
                    type="password"
                    component={FormInput}
                    label="Password"
                  />
                </Grid>
                <Grid container justify="flex-end" alignItems="flex-end">
                  <Grid item xs={3} className={classes.grid}>
                    <Button
                      color="primary"
                      variant="contained"
                      type="submit"
                      className={classes.button}
                    >
                      Send
                      <Icon className={classes.rightIcon}>send</Icon>
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
  onSubmit: doSignUpForm
};

SignUpContainer = reduxForm(signUpForm)(SignUpContainer);
export default withRouter(
  connect(
    undefined,
    { onSubmit: doSignUpForm }
  )(withStyles(styles)(SignUpContainer))
);
