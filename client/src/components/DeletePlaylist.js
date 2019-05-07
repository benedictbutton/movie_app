import React, { Component } from "react";
import { connect } from "react-redux";
import { doPlaylistDeleteRequesting } from "../redux/actions/playlistActions";
import Confirmation from "./Confirmation";
// material-ui
import Grid from "@material-ui/core/Grid";
import DeleteIcon from "@material-ui/icons/Delete";
import IconButton from "@material-ui/core/IconButton";
import Tooltip from "@material-ui/core/Tooltip";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  grid: {
    marginBottom: theme.spacing.unit * 7
  }
});

class DeletePlaylist extends Component {
  state = {
    open: false
  };

  handleOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  handleDelete = id => {
    this.props.doPlaylistDeleteRequesting(id);
    this.handleClose();
  };

  render() {
    const { classes } = this.props;
    return (
      <div className={classes.listItemSecondaryAction}>
        {this.props.hover ? (
          <IconButton
            aria-label="Delete"
            onClick={event => {
              event.preventDefault();
              this.handleOpen();
            }}
          >
            <DeleteIcon style={{ color: "red" }} />
          </IconButton>
        ) : (
          <Grid item className={classes.grid}>
            {"   "}
          </Grid>
        )}
        <Confirmation
          id={this.props.id}
          playlistName={this.props.playlistName}
          open={this.state.open}
          handleOpen={this.handleOpen}
          handleClose={this.handleClose}
          handleDelete={this.handleDelete}
          handleMouseLeave={this.props.handleMouseLeave}
        />
      </div>
    );
  }
}

export default connect(
  null,
  { doPlaylistDeleteRequesting }
)(withStyles(styles)(DeletePlaylist));
