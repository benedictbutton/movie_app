import React from "react";
import Image from "../assets/brushed-metal.jpg";
//material-ui
import Avatar from "@material-ui/core/Avatar";
import AccountCircleIcon from "@material-ui/icons/AccountCircle";
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    marginLeft: theme.spacing.unit * 6,
    jusify: "flex-start",
    alignItems: "flex-start"
  },
  icon: {
    color: "#ecca00",
    zIndex: 20,
    position: "absolute"
  },
  paper: {
    backgroundImage: `url(${Image})`,
    borderStyle: "ridge",
    borderWidth: 15,
    marginTop: theme.spacing.unit * 20,
    marginBottom: theme.spacing.unit * 3,
    padding: theme.spacing.unit * 2,
    [theme.breakpoints.up(800 + theme.spacing.unit * 3 * 2)]: {
      marginTop: theme.spacing.unit * 20,
      marginBottom: theme.spacing.unit * 8
    },
    zIndex: 10,
    position: "absolute"
  },
  type: {
    flex: 1,
    fontFamily: "'NewTimesRoman', serif",
    fontWeight: "700",
    color: "blue"
  }
});

const User = props => {
  const { classes } = props;
  const { firstName, lastName, username, email } = props.user.profile;

  return (
    <>
      <Grid container className={classes.root}>
        <div position="absolute">
          <AccountCircleIcon
            className={classes.icon}
            style={{ fontSize: 200 }}
          />
          <Paper className={classes.paper} align="left">
            <Typography variant="h2" gutterBottom className={classes.type}>
              Profile
            </Typography>
            <Grid
              container
              spacing={24}
              justify="space-around"
              alignItems="flex-start"
            >
              <Grid item xs={5} align="left">
                <Typography
                  variant="h5"
                  component="h4"
                  className={classes.type}
                >
                  First Name
                </Typography>
              </Grid>
              <Grid item xs={5} align="left">
                <Typography variant="h5" component="h3">
                  {firstName}
                </Typography>
              </Grid>
              <Grid item xs={5} align="left">
                <Typography
                  variant="h5"
                  component="h4"
                  className={classes.type}
                >
                  Last Name
                </Typography>
              </Grid>

              <Grid item xs={5} align="left">
                <Typography variant="h5" component="h3">
                  {lastName}
                </Typography>
              </Grid>
              <Grid item xs={5} align="left">
                <Typography
                  variant="h5"
                  component="h4"
                  className={classes.type}
                >
                  Username
                </Typography>
              </Grid>

              <Grid item xs={5} align="left">
                <Typography variant="h5" component="h3">
                  {username}
                </Typography>
              </Grid>
              <Grid item xs={5} align="left">
                <Typography
                  variant="h5"
                  component="h4"
                  className={classes.type}
                >
                  Email
                </Typography>
              </Grid>

              <Grid item xs={5} align="left">
                <Typography variant="h5" component="h3">
                  {email}
                </Typography>
              </Grid>
            </Grid>
          </Paper>
        </div>
      </Grid>
    </>
  );
};

export default withStyles(styles)(User);
