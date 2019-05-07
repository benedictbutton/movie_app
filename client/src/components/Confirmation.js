import React from "react";
// material-ui
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";

const Confirmation = props => {
  return (
    <Dialog
      open={props.open}
      onClose={props.handleClose}
      aria-labelledby="alert-dialog-title"
      aria-describedby="alert-dialog-description"
    >
      <DialogContent>
        <DialogContentText id="alert-dialog-description">
          Are you sure you want to delete {props.playlistName}?
        </DialogContentText>
      </DialogContent>
      <DialogActions>
        <Button
          onClick={event => {
            event.preventDefault();
            props.handleClose();
            props.handleMouseLeave();
          }}
          color="primary"
        >
          Cancel
        </Button>
        <Button
          onClick={event => {
            event.preventDefault();
            props.handleDelete(props.id);
          }}
          color="primary"
          autoFocus
        >
          Delete
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default Confirmation;
