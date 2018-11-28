import React from "react";
import DrawerContainer from "./DrawerContainer";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { withRouter } from "react-router-dom";
//material-ui
import AppBar from "@material-ui/core/AppBar";
import Grid from "@material-ui/core/AppBar";
import Paper from "@material-ui/core/Paper";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
import { createMuiTheme } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flexGrow: 1
  },
  appBar: {
    position: "relative",
    backgroundColor: "primary"
  },
  heroUnit: {
    backgroundColor: theme.palette.background.paper
  },
  heroContent: {
    width: "100%",
    margin: "0 auto",
    padding: `${theme.spacing.unit * 5}px 0 ${theme.spacing.unit * 3}px`
  },
  type: {
    color: "#ffff99",
    fontWeight: "900",
    fontFamily: "'Cinzel', serif"
  }
});

const HeaderContainer = props => {
  const { classes } = props;

  return (
    <>
      <AppBar position="static" className={classes.appBar}>
        <Toolbar>
          <Typography variant="h6" color="inherit" noWrap>
            <DrawerContainer />
          </Typography>
        </Toolbar>
      </AppBar>

      <Paper className={classes.heroContent} id="image">
        <Typography
          component="h1"
          variant="h1"
          align="center"
          className={classes.type}
          gutterBottom
        >
          MOVIES SCENE
        </Typography>
      </Paper>
    </>
  );
};

export default withRouter(withStyles(styles)(HeaderContainer));