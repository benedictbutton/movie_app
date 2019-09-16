import React from "react";
import { connect } from "react-redux";
import { withRouter } from "react-router-dom";
import ActivePlaylistContainer from "./ActivePlaylistContainer";
import DrawerContainer from "./DrawerContainer";
import Title from "../components/Title";
//material-ui
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flexGrow: 1
  },
  active: {
    display: "flex",
    marginTop: theme.spacing.unit * 1
  },
  appBar: {
    position: "relative",
    backgroundColor: "#0b0b0b"
  },
  heroUnit: {
    backgroundColor: theme.palette.background.paper
  },
  heroContent: {
    width: "100%",
    margin: "0 auto",
    bottomPadding: `${theme.spacing.unit * 5}px`
  }
});

const HeaderContainer = props => {
  const { classes, client } = props;

  return (
    <>
      <Paper className={classes.heroContent} id="image">
        <Grid container alignItems="flex-start" justify="flex-start">
          <Grid item>
            <DrawerContainer />
          </Grid>
        </Grid>
        <Title />
      </Paper>
      <Grid
        container
        spacing={8}
        className={classes.active}
        alignItems="center"
        justify="flex-start"
      />
    </>
  );
};

const mapStateToProps = state => ({
  client: state.client
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(withStyles(styles)(HeaderContainer))
);
