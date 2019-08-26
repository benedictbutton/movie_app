import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { reduxForm, Field } from "redux-form";
import { doResetRequesting, doSignOut } from "../redux/actions/formActions";
import { getClient } from "../redux/selectors/selectors";
import FormInput from "../components/FormInput";
import {
  required,
  alphaNumeric,
  maxLength15,
  minLength7,
  passwordLowercase,
  passwordUppercase,
  passwordNumber,
  passwordsMatch
} from "../util/validations";
// material-ui
import AssignmentIcon from "@material-ui/icons/Assignment";
import Avatar from "@material-ui/core/Avatar";
import Grid from "@material-ui/core/Grid";
import Button from "@material-ui/core/Button";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
import HomeContainer from "./HomeContainer";
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

class ResetPasswordContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      authenticated: null,
      redirect: false
    };
  }

  handleRedirect = () => {
    this.setState({ redirect: true });
  };

  componentDidMount() {
    let authenticate = async () => {
      try {
        let response = await fetch(
          `${process.env.REACT_APP_API_URL}/reset_request/${
            this.props.match.params.id
          }`,
          {
            credentials: "same-origin",
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${this.props.match.params.pass}`
            }
          }
        );
        let responseJson = await response.json();
        if (!response.ok || responseJson.status === "error") {
          debugger;
          this.props.dispatch({
            type: "RESET_ERROR",
            error: {
              body: null,
              message: responseJson.message,
              code: null
            }
          });
          this.setState((prevState, props) => ({
            authenticated: false
          }))();
          throw responseJson;
          this.handleError();
        }
        this.setState((prevState, props) => ({
          authenticated: true
        }))();
        return responseJson;
      } catch (error) {
        return error;
      }
    };
    authenticate();
  }

  render() {
    const {
      handleSubmit,
      pristine,
      submitting,
      valid,
      client: { requesting, successful, notifications, display },
      classes
    } = this.props;

    if (this.state.authenticated === false || this.state.redirect) {
      return <Redirect to="/" />;
    }

    if (this.props.client.reset) {
      this.props.doSignOut();
      this.props.dispatch({
        type: "RESET_ERROR",
        error: {
          body: null,
          message: "Password successfully reset.",
          code: null
        }
      });
      return <Redirect to="/ms/sign-in" />;
    }

    return (
      this.state.authenticated && (
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
                  gutterBottom
                >
                  Reset Password
                </Typography>
              </Grid>
            </Grid>
            <form onSubmit={handleSubmit} noValidate autoComplete="off">
              <Grid container spacing={24}>
                <Grid item xs={12}>
                  <Field
                    name="password"
                    type="password"
                    component={FormInput}
                    label="New Password"
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
                    label="Confirm New Password"
                    validate={[required, passwordsMatch]}
                  />
                </Grid>
                <Grid container justify="flex-end" alignItems="flex-end">
                  <Grid item xs={2} className={classes.grid}>
                    <Button
                      color="secondary"
                      variant="contained"
                      className={classes.button}
                      onClick={this.handleRedirect}
                    >
                      Cancel
                    </Button>
                  </Grid>
                  <Grid item xs={2}>
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
      )
    );
  }
}

const resetForm = {
  form: `reset`,
  onSubmit: doResetRequesting
};

const mapStateToProps = (state, props) => {
  return {
    client: getClient(state),
    initialValues: { id: props.match.params.id, pass: props.match.params.pass } // passes value to redux forms params
  };
};

ResetPasswordContainer = reduxForm(resetForm)(ResetPasswordContainer);
export default withRouter(
  connect(
    mapStateToProps,
    { onSubmit: doResetRequesting, doSignOut }
  )(withStyles(styles)(ResetPasswordContainer))
);
