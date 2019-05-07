import React, { Component } from "react";
import { connect } from "react-redux";
import { doPlaylistDeleteRequesting } from "../redux/actions/playlistActions";
import Confirmation from "./Confirmation";
// material-ui
import DeleteIcon from "@material-ui/icons/Delete";
import IconButton from "@material-ui/core/IconButton";
import Tooltip from "@material-ui/core/Tooltip";

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
    return (
      <div>
        {this.props.hover ? (
          <Tooltip title="delete" placement="bottom-end">
            <IconButton aria-label="Delete" onClick={this.handleOpen}>
              <DeleteIcon style={{ color: "red" }} />
            </IconButton>
          </Tooltip>
        ) : null}
        <Confirmation
          id={this.props.id}
          playlistName={this.props.playlistName}
          open={this.state.open}
          handleOpen={this.handleOpen}
          handleClose={this.handleClose}
          handleDelete={this.handleDelete}
        />
      </div>
    );
  }
}

export default connect(
  null,
  { doPlaylistDeleteRequesting }
)(DeletePlaylist);
