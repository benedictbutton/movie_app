import React, { Component } from "react";
import DeletePlaylist from "./DeletePlaylist";
import Image from "../assets/brushed-metal.jpg";
import ButtonBase from "@material-ui/core/ButtonBase";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  paper: {
    display: "table-cell",
    background: `url(${Image})`,
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

class EmptyPlaylist extends Component {
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
    const { classes, id } = this.props;
    return (
      <>
        <div
          onMouseEnter={this.handleMouseEnter}
          onMouseLeave={this.handleMouseLeave}
        >
          <ButtonBase
            className={classes.paper}
            component={Paper}
            onClick={this.props.handleClick({
              vertical: "bottom",
              horizontal: "left"
            })}
          >
            <Typography variant="h4" align="center">
              {this.props.playlistName}
            </Typography>
          </ButtonBase>
          <DeletePlaylist id={id} hover={this.state.hover} />
        </div>
      </>
    );
  }
}

export default withStyles(styles)(EmptyPlaylist);
