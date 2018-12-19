import React from "react";
import { connect } from "react-redux";
import { doToggleDisplay } from "../redux/actions/formActions";
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
  const { classes } = props;

  return (
    <div>
      <Modal
        aria-labelledby="simple-modal-title"
        aria-describedby="simple-modal-description"
        open={props.client.display}
        onClose={props.onToggleDisplay}
      >
        <div style={getModalStyle()} className={classes.paper}>
          <Typography variant="h6" id="modal-title">
            {props.client.messages}
          </Typography>
          <Typography variant="subtitle1" id="simple-modal-description" />
        </div>
      </Modal>
    </div>
  );
};

const mapStateToProps = state => ({
  client: state.client
});

export default connect(
  mapStateToProps,
  { onToggleDisplay: doToggleDisplay }
)(withStyles(styles)(Notifications));
