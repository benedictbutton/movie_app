import React from "react";
import { connect } from "react-redux";
import { doUnSetError } from "../redux/actions/notificationActions";
//material-ui
import CloseIcon from "@material-ui/icons/Close";
import IconButton from "@material-ui/core/IconButton";
import Modal from "@material-ui/core/Modal";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

function rand() {
  return Math.round(Math.random() * 20) - 10;
}

function getModalStyle() {
  const top = 50 + rand();
  const left = 50 + rand();

  return {
    top: `${top}%`,
    left: `${left}%`,
    transform: `translate(-${top}%, -${left}%)`
  };
}

const styles = theme => ({
  closeButton: {
    position: "absolute",
    right: theme.spacing.unit,
    top: theme.spacing.unit,
    color: theme.palette.grey[500]
  },
  paper: {
    position: "absolute",
    width: theme.spacing.unit * 50,
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
    padding: theme.spacing.unit * 4
  }
});

export const Notifications = props => {
  const { children, classes } = props;

  return (
    <div>
      {children ? (
        <Modal
          aria-labelledby="simple-modal-title"
          aria-describedby="simple-modal-description"
          open={children.display}
          onClose={props.doUnSetError}
        >
          <div style={getModalStyle()} className={classes.paper}>
            <IconButton
              aria-label="Close"
              className={classes.closeButton}
              onClick={props.doUnSetError}
            >
              <CloseIcon />
            </IconButton>
            <Typography variant="h6" id="modal-title" align="center">
              {children.message}
            </Typography>
            <Typography variant="subtitle1" id="simple-modal-description" />
          </div>
        </Modal>
      ) : null}
    </div>
  );
};

const mapStateToProps = state => ({
  client: state.client
});

export default connect(
  mapStateToProps,
  { doUnSetError }
)(withStyles(styles)(Notifications));
