import React, { Component } from "react";
import { Link } from "react-router-dom";
import debounce from "lodash/debounce";
import Add from "./Add";
import Stars from "./Stars";
import ActionIconsContainer from "../containers/ActionIconsContainer";
//material-ui
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
    this.handleMouseEnterDebounced = debounce(
      this.handleMouseEnter.bind(this),
      200
    );
    this.handleMouseLeaveDebounced = debounce(
      this.handleMouseLeave.bind(this),
      200
    );
  }

  handleMouseEnter(target) {
    this.setState({ starsVisible: target });
  }

  handleMouseLeave() {
    this.setState({ starsVisible: null });
  }

  render() {
    const { movie, imageUrl, width, classes, profile } = this.props;

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
          aria-owns={open ? movie.id : undefined}
          aria-haspopup="true"
          onMouseEnter={event => {
            let target = event.currentTarget;
            this.handleMouseEnterDebounced(target);
          }}
          onMouseLeave={this.handleMouseLeaveDebounced}
        >
          <ActionIconsContainer
            id={movie.id}
            actionPosition="right"
            titlePosition="top"
            actionIcon={!profile ? <Add id={movie.id} movie={movie} /> : null}
            open={open}
            onClose={this.handleMouseLeaveDebounced}
            starsVisible={this.state.starsVisible}
          />
          <Link
            to={{
              pathname: `/ms/movie/${movie.id}`,
              state: {
                imageUrl: imageUrl,
                movie: movie,
                profile
              }
            }}
          >
            <img src={imageUrl} alt="test" width="100%" height="100%" />
          </Link>
          <ActionIconsContainer
            id={movie.id}
            actionPosition="center"
            actionIcon={
              !profile ? (
                <Stars id={movie.id} movie={movie} starSize={starSize[width]} />
              ) : null
            }
            open={open}
            onClose={this.handleMouseLeaveDebounced}
            starsVisible={this.state.starsVisible}
          />
        </div>
      </>
    );
  }
}

export default withWidth()(withStyles(styles)(MovieCard));
