import React, { Component } from "react";
import { Link, Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reduxForm, Field } from "redux-form";
import { doSignInRequesting } from "../redux/actions/formActions";
import { getClient } from "../redux/selectors/selectors";
import ForgotPassword from "../components/ForgotPassword";
import FormInput from "../components/FormInput";
import LoadingIndicator from "../components/LoadingIndicator";
import Notifications from "../components/Notifications";
//material-ui
import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
import FormControl from "@material-ui/core/FormControl";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Grid from "@material-ui/core/Grid";
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
  button: {
    marginTop: theme.spacing.unit * 2
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
  state = {
    open: false
  };

  handleOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  render() {
    const { handleSubmit, classes, client } = this.props;

    const MyLink = props => <Link to="/" {...props} />;

    if (client.successful) {
      return <Redirect to="/ms/movies/discover/18" />;
    }

    return (
      <>
        <main className={classes.layout}>
          <LoadingIndicator>{client}</LoadingIndicator>
          <Paper className={classes.paper}>
            <Avatar className={classes.avatar}>
              <LockIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
              Sign In
            </Typography>
            <form
              className={classes.form}
              onSubmit={this.state.open ? null : handleSubmit}
            >
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
              <Grid container justify="space-around" alignItems="center">
                <FormControlLabel
                  control={<Checkbox value="remember" color="primary" />}
                  label="Remember me"
                />
                <ForgotPassword
                  open={this.state.open}
                  handleOpen={this.handleOpen}
                  handleClose={this.handleClose}
                />
              </Grid>
              <Button
                type="submit"
                fullWidth
                variant="contained"
                color="primary"
                className={classes.submit}
                disabled={this.state.open}
              >
                Sign in
              </Button>
              <Button
                fullWidth
                className={classes.button}
                component={MyLink}
                align="left"
                variant="contained"
                color="secondary"
                disabled={this.state.open}
              >
                Cancel
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
