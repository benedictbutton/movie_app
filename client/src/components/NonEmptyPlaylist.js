import React, { Component } from "react";
import DeletePlaylist from "./DeletePlaylist";
import Image from "../assets/brushed-metal.jpg";
// material-ui
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  paper: {
    display: "table-cell",
    background: `url(${Image})`,
    maxWidth: 225,
    width: 225,
    height: 300,
    verticalAlign: "middle",
    "&:hover": {
      borderStyle: "solid",
      borderColor: "#ecca00",
      borderWidth: 5
    }
  }
});

class NonEmptyPlaylist extends Component {
  constructor(props) {
    super(props);
    this.state = {
      hover: false
    };
    this.handleMouseEnter = this.handleMouseEnter.bind(this);
    this.handleMouseLeave = this.handleMouseLeave.bind(this);
  }

  handleMouseEnter(event) {
    this.setState({ hover: true });
  }

  handleMouseLeave() {
    this.setState({ hover: false });
  }

  render() {
    const { classes, id, playlistName } = this.props;
    return (
      <>
        <Grid container justify="center">
          <Grid
            item
            onMouseEnter={this.handleMouseEnter}
            onMouseLeave={this.handleMouseLeave}
          >
            <Paper className={classes.paper}>
              <Typography variant="h4" align="center">
                {this.props.playlistName}
              </Typography>
            </Paper>
            <DeletePlaylist
              id={id}
              playlistName={playlistName}
              hover={this.state.hover}
              handleMouseLeave={this.handleMouseLeave}
            />
          </Grid>
        </Grid>
      </>
    );
  }
}

export default withStyles(styles)(NonEmptyPlaylist);
