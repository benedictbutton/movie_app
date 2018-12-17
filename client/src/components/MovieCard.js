import React, { Component } from "react";
import { Link, withRouter } from "react-router-dom";
//material-ui
import GridListTileBar from "@material-ui/core/GridListTileBar";
import MovieContainer from "../containers/MovieContainer";
import Stars from "../components/Stars";
import StarsContainer from "../containers/StarsContainer";
import { withStyles } from "@material-ui/core/styles";
import withWidth from "@material-ui/core/withWidth";

const styles = theme => ({
  titleBar: {
    background:
      "linear-gradient(to bottom, rgba(0,0,0,0.7) 0%, " +
      "rgba(0,0,0,0.3) 70%, rgba(0,0,0,0) 100%)"
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
    debugger;
    this.setState({ starsVisible: event.currentTarget });
  }

  handleMouseLeave = () => {
    this.setState({ starsVisible: null });
  };

  render() {
    const { classes, id, title, imageUrl, overview, width } = this.props;

    const starSize = {
      xs: 20,
      lg: 18
    };

    const open = Boolean(this.state.starsVisible);

    return (
      <>
        <div
          aria-owns={open ? title : undefined}
          aria-haspopup="true"
          onMouseEnter={this.handleMouseEnter}
          onMouseLeave={this.handleMouseLeave}
        >
          <Link
            to={{
              pathname: `/ms/movie/${id}`,
              state: {
                title: title,
                imageUrl: imageUrl,
                overview: overview
              }
            }}
          >
            <img src={imageUrl} alt="test" width="100%" height="100%" />
          </Link>
          <StarsContainer
            id={title}
            actionPosition="left"
            actionIcon={<Stars starSize={starSize[width]} />}
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
