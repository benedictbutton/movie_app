import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reduxForm, Field } from "redux-form";
import { doSignInRequesting } from "../redux/actions/formActions";
import { getClient } from "../redux/selectors/selectors";
import FormInput from "../components/FormInput";
import Notifications from "../components/Notifications";
//material-ui
import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
import FormControl from "@material-ui/core/FormControl";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Checkbox from "@material-ui/core/Checkbox";
import LockIcon from "@material-ui/icons/LockOutlined";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
//Redux-Form generic Input component used in leiu of //FormInput

const styles = theme => ({
  layout: {
    width: "auto",
    display: "block", // Fix IE11 issue.
    marginLeft: theme.spacing.unit * 3,
    marginRight: theme.spacing.unit * 3,
    [theme.breakpoints.up(400 + theme.spacing.unit * 3 * 2)]: {
      width: 400,
      marginLeft: "auto",
      marginRight: "auto"
    }
  },
  paper: {
    marginTop: theme.spacing.unit * 8,
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: `${theme.spacing.unit * 2}px ${theme.spacing.unit * 3}px ${theme
      .spacing.unit * 3}px`
  },
  avatar: {
    margin: theme.spacing.unit,
    backgroundColor: theme.palette.secondary.main
  },
  form: {
    width: "100%", // Fix IE11 issue.
    marginTop: theme.spacing.unit
  },
  submit: {
    marginTop: theme.spacing.unit * 3
  }
});

class SignInContainer extends Component {
  render() {
    const { handleSubmit, classes, client } = this.props;

    if (client.successful) {
      return <Redirect to="/ms/movies" />;
    }

    return (
      <>
        <main className={classes.layout}>
          <Paper className={classes.paper}>
            <Avatar className={classes.avatar}>
              <LockIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
              Sign In
            </Typography>
            <form className={classes.form} onSubmit={handleSubmit}>
              <FormControl margin="normal" required fullWidth>
                <Field
                  type="text"
                  name="email"
                  label="Email"
                  id="email"
                  autoComplete="email"
                  autoFocus
                  component={FormInput}
                />
              </FormControl>
              <FormControl margin="normal" required fullWidth>
                <Field
                  name="password"
                  type="password"
                  label="Password"
                  id="password"
                  component={FormInput}
                />
              </FormControl>
              <FormControlLabel
                control={<Checkbox value="remember" color="primary" />}
                label="Remember me"
              />
              <Button
                type="submit"
                fullWidth
                variant="contained"
                color="primary"
                className={classes.submit}
              >
                Sign in
              </Button>
            </form>
          </Paper>
        </main>
        <Notifications>{client.notifications}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  client: getClient(state)
});

const signInForm = {
  form: `signin`,
  onSubmit: doSignInRequesting
};

SignInContainer = reduxForm(signInForm)(SignInContainer);
export default withRouter(
  connect(
    mapStateToProps,
    { onSubmit: doSignInRequesting }
  )(withStyles(styles)(SignInContainer))
);
