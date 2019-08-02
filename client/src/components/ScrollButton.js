import React, { Component } from "react";
// material-ui
import Fab from "@material-ui/core/Fab";
import UpIcon from "@material-ui/icons/KeyboardArrowUp";

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
    const { classes } = this.props;
    return (
      <Fab
        onClick={this.scrollToTop}
        style={{ position: "fixed", bottom: 20, right: 10, zIndex: 1 }}
      >
        <UpIcon />
      </Fab>
    );
  }
}

export default ScrollButton;
