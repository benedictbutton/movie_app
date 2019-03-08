import React, { Component } from "react";
import { Link, withRouter } from "react-router-dom";
import Add from "./Add";
import Stars from "./Stars";
import ActionIconsContainer from "../containers/ActionIconsContainer";
//material-ui
import Grid from "@material-ui/core/Grid";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  root: {
    flex: 1
  }
});

class MovieCard extends Component {
  constructor(props) {
    super(props);
    this.state = {
      starsVisible: null
    };
    this.handleMouseEnter = this.handleMouseEnter.bind(this);
    this.handleMouseLeave = this.handleMouseLeave.bind(this);
  }

  handleMouseEnter(event) {
    this.setState({ starsVisible: event.currentTarget });
  }

  handleMouseLeave = () => {
    this.setState({ starsVisible: null });
  };

  render() {
    const {
      id,
      title,
      imageUrl,
      overview,
      width,
      handleRating,
      classes
    } = this.props;

    const starSize = {
      xs: 14,
      sm: 17,
      md: 19,
      lg: 18,
      xl: 18
    };
    console.log(width);

    const open = Boolean(this.state.starsVisible);

    return (
      <>
        <div
          className={classes.root}
          aria-owns={open ? id : undefined}
          aria-haspopup="true"
          onMouseEnter={this.handleMouseEnter}
          onMouseLeave={this.handleMouseLeave}
        >
          <ActionIconsContainer
            id={id}
            actionPosition="right"
            titlePosition="top"
            actionIcon={<Add id={id} />}
            open={open}
            onClose={this.handleMouseLeave}
            starsVisible={this.state.starsVisible}
          />
          <Link
            to={{
              pathname: `/ms/movie/${id}`,
              state: {
                id: id,
                title: title,
                imageUrl: imageUrl,
                overview: overview
              }
            }}
          >
            <img src={imageUrl} alt="test" width="100%" height="100%" />
          </Link>
          <ActionIconsContainer
            id={id}
            actionPosition="left"
            actionIcon={
              <Stars
                id={id}
                handleRating={handleRating}
                starSize={starSize[width]}
              />
            }
            open={open}
            onClose={this.handleMouseLeave}
            starsVisible={this.state.starsVisible}
          />
        </div>
      </>
    );
  }
}

export default withRouter(withWidth()(withStyles(styles)(MovieCard)));
