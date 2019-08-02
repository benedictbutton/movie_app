import React, { Component } from "react";
// material-ui
import Fab from "@material-ui/core/Fab";
import UpIcon from "@material-ui/icons/KeyboardArrowUp";
import { withStyles } from "@material-ui/core/styles";

// fix size issue
const styles = theme => ({
  fab: {
    backgroundColor: "black",
    color: "yellow",
    position: "fixed",
    border: "solid",
    borderColor: "yellow",
    bottom: 20,
    right: 10,
    zIndex: 1,
    opacity: 0.3,
    "&:hover": {
      backgroundColor: "black",
      opacity: 1
    }
  }
});

class ScrollButton extends React.Component {
  state = {
    intervalId: 0
  };

  scrollStep = () => {
    if (window.pageYOffset === 0) {
      clearInterval(this.state.intervalId);
    }
    window.scroll(0, window.pageYOffset - this.props.scrollStepInPx);
  };

  scrollToTop = () => {
    let intervalId = setInterval(
      this.scrollStep.bind(this),
      this.props.delayInMs
    );
    this.setState({ intervalId: intervalId });
  };

  render() {
    const { classes, width } = this.props;

    return (
      <Fab onClick={this.scrollToTop} className={classes.fab}>
        <UpIcon />
      </Fab>
    );
  }
}

export default withStyles(styles)(ScrollButton);
