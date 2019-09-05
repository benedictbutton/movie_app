import React, { Component } from "react";
import { Link } from "react-router-dom";
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
    const { movie, imageUrl, width, classes } = this.props;

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
          onMouseEnter={this.handleMouseEnter}
          onMouseLeave={this.handleMouseLeave}
        >
          <ActionIconsContainer
            id={movie.id}
            actionPosition="right"
            titlePosition="top"
            actionIcon={<Add id={movie.id} movie={movie} />}
            open={open}
            onClose={this.handleMouseLeave}
            starsVisible={this.state.starsVisible}
          />
          <Link
            to={{
              pathname: `/ms/movie/${movie.id}`,
              state: {
                imageUrl: imageUrl,
                movie: movie
              }
            }}
          >
            <img src={imageUrl} alt="test" width="100%" height="100%" />
          </Link>
          <ActionIconsContainer
            id={movie.id}
            actionPosition="left"
            actionIcon={
              <Stars id={movie.id} movie={movie} starSize={starSize[width]} />
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

export default withWidth()(withStyles(styles)(MovieCard));
