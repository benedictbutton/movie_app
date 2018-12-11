import React from "react";
import Image from "../assets/grey-small.jpg";
//material-ui
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Typography from "@material-ui/core/Typography";
import Icon from "@material-ui/core/Icon";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  layout: {
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "space-around",
    margin: theme.spacing.unit * 6
  },
  paper: {
    flex: 1,
    marginTop: theme.spacing.unit * 3,
    marginBottom: theme.spacing.unit * 3,
    padding: theme.spacing.unit * 2,
    [theme.breakpoints.up(800 + theme.spacing.unit * 3 * 2)]: {
      marginTop: theme.spacing.unit * 8,
      marginBottom: theme.spacing.unit * 8
    }
  },
  type: {
    fontFamily: "'Cinzel', serif",
    fontWeight: "700"
  }
});

const User = props => {
  const { classes } = props;
  const { firstName, lastName, username, email } = props.user.profile;

  return (
    <>
      <main className={classes.layout}>
        <Paper className={classes.paper} id="paper">
          <Typography
            variant="h2"
            gutterBottom
            align="center"
            className={classes.type}
          >
            Profile
          </Typography>
          <Grid container spacing={24} justify="center">
            <Grid item xs={5} align="right">
              <Typography variant="h5" component="h4" className={classes.type}>
                First Name
              </Typography>
            </Grid>
            <Grid item xs={2}>
              <Typography noWrap variant="h5" component="h3">
                ......................
              </Typography>
            </Grid>
            <Grid item xs={5} align="left">
              <Typography variant="h5" component="h3">
                {firstName}
              </Typography>
            </Grid>
            <Grid item xs={5} align="right">
              <Typography variant="h5" component="h4" className={classes.type}>
                Last Name
              </Typography>
            </Grid>
            <Grid item xs={2}>
              <Typography noWrap variant="h5" component="h3">
                ..............
              </Typography>
            </Grid>
            <Grid item xs={5} align="left">
              <Typography variant="h5" component="h3">
                {lastName}
              </Typography>
            </Grid>
            <Grid item xs={5} align="right">
              <Typography variant="h5" component="h4" className={classes.type}>
                Username
              </Typography>
            </Grid>
            <Grid item xs={2}>
              <Typography noWrap variant="h5" component="h3">
                ......................
              </Typography>
            </Grid>
            <Grid item xs={5} align="left">
              <Typography variant="h5" component="h3">
                {username}
              </Typography>
            </Grid>
            <Grid item xs={5} align="right">
              <Typography variant="h5" component="h4" className={classes.type}>
                Email
              </Typography>
            </Grid>
            <Grid item xs={2}>
              <Typography noWrap variant="h5" component="h3">
                ......................
              </Typography>
            </Grid>
            <Grid item xs={5} align="left">
              <Typography variant="h5" component="h3">
                {email}
              </Typography>
            </Grid>
          </Grid>
        </Paper>
      </main>
    </>
  );
};

export default withStyles(styles)(User);
