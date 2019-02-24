import React from "react";
import { connect } from "react-redux";
import { doUnSetError } from "../redux/actions/notificationActions";
//material-ui
import Typography from "@material-ui/core/Typography";
import Modal from "@material-ui/core/Modal";
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
  paper: {
    position: "absolute",
    width: theme.spacing.unit * 50,
    backgroundColor: theme.palette.background.paper,
    boxShadow: theme.shadows[5],
    padding: theme.spacing.unit * 4
  }
});

const Notifications = props => {
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
