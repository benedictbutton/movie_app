import React from "react";
import { connect } from "react-redux";
import { doPlaylistDeleteRequesting } from "../redux/actions/playlistActions";
// material-ui
import DeleteIcon from "@material-ui/icons/Delete";
import IconButton from "@material-ui/core/IconButton";
import Tooltip from "@material-ui/core/Tooltip";

const DeletePlaylist = props => {
  return (
    <div>
      {props.hover ? (
        <Tooltip title="delete" placement="bottom-end">
          <IconButton
            aria-label="Delete"
            onClick={event => {
              event.preventDefault();
              props.doPlaylistDeleteRequesting(props.id);
            }}
          >
            <DeleteIcon style={{ color: "red" }} />
          </IconButton>
        </Tooltip>
      ) : null}
    </div>
  );
};

export default connect(
  null,
  { doPlaylistDeleteRequesting }
)(DeletePlaylist);
