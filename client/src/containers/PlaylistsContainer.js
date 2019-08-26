import React, { Component } from "react";
import { connect } from "react-redux";
import { reduxForm, Field } from "redux-form";
import {
  doPlaylistsRequesting,
  doPlaylistAddRequesting
} from "../redux/actions/playlistActions";
import { getPlaylistErrors } from "../redux/selectors/selectors";
import FormCheckbox from "../components/FormCheckbox";
import FormInput from "../components/FormInput";
import Notifications from "../components/Notifications";
import PlaylistCards from "../components/PlaylistCards";
import { maxLength15 } from "../util/validations";
// material-ui
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";

class PlaylistsContainer extends Component {
  state = {
    open: false
  };

  componentDidMount() {
    this.props.doPlaylistsRequesting();
  }

  handleClickOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  render() {
    const {
      handleSubmit,
      pristine,
      submitting,
      valid,
      playlistErrors
    } = this.props;

    return (
      <>
        <PlaylistCards
          playlists={this.props.playlists}
          handleClickOpen={this.handleClickOpen}
        />
        <div>
          <Dialog
            open={this.state.open}
            onClose={this.handleClose}
            aria-labelledby="form-dialog-title"
          >
            <DialogTitle id="form-dialog-title">
              Enter Playlist Title
            </DialogTitle>
            <form onSubmit={handleSubmit} noValidate autoComplete="off">
              <DialogContent>
                <Field
                  name="title"
                  type="text"
                  component={FormInput}
                  label="Title"
                  validate={[maxLength15]}
                />
                <Field name="active" component={FormCheckbox} />
              </DialogContent>
              <DialogActions>
                <Button onClick={this.handleClose} color="primary">
                  Cancel
                </Button>
                <Button
                  onClick={this.handleClose}
                  color="primary"
                  type="submit"
                  disabled={!valid || pristine || submitting}
                >
                  Create
                </Button>
              </DialogActions>
            </form>
          </Dialog>
        </div>
        <Notifications>{playlistErrors}</Notifications>
      </>
    );
  }
}

const playlistForm = {
  form: `playlist`,
  onSubmit: doPlaylistAddRequesting
};

PlaylistsContainer = reduxForm(playlistForm)(PlaylistsContainer);

const mapStateToProps = state => ({
  playlists: state.playlists,
  playlistErrors: getPlaylistErrors(state)
});

export default connect(
  mapStateToProps,
  {
    onSubmit: doPlaylistAddRequesting,
    doPlaylistsRequesting
  }
)(PlaylistsContainer);
