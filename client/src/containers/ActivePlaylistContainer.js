import React, { Component } from "react";
import { connect } from "react-redux";
import { doPlaylistUpdateActiveRequesting } from "../redux/actions/playlistActions";
import { getPlaylists, getActivePlaylist } from "../redux/selectors/selectors";
import Image from "../assets/dark-grey-metal.jpg";
// material-ui
import Button from "@material-ui/core/Button";
import Chip from "@material-ui/core/Chip";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import FormControl from "@material-ui/core/FormControl";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import PlaylistPlayOutlinedIcon from "@material-ui/icons/PlaylistPlayOutlined";
import Radio from "@material-ui/core/Radio";
import RadioGroup from "@material-ui/core/RadioGroup";
import Tooltip from "@material-ui/core/Tooltip";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    display: "flex",
    justifyContent: "center",
    flexWrap: "wrap"
  },
  chip: {
    color: "yellow",
    backgroundColor: "#0b0b0b",
    border: "solid",
    marginLeft: theme.spacing.unit * 2
  },
  lightTooltip: {
    backgroundColor: theme.palette.common.white,
    boxShadow: theme.shadows[1]
  },
  title: {
    color: "#ecca00"
  },
  label: {
    color: theme.palette.primary.main,
    fontSize: 18
  },
  radio: {
    color: theme.palette.primary.main
  },
  button: {
    color: "#ecca00"
  }
});

const radioStyles = theme => ({
  root: {
    color: theme.palette.primary.main,
    "&$checked": {
      color: "#ecca00"
    }
  },
  checked: {}
});

const MyRadio = withStyles(radioStyles)(Radio);

class ActivePlaylistContainer extends Component {
  state = {
    open: false
  };

  handleClickOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  handleChange = (event, playlists) => {
    let playlist = playlists.filter(
      playlist => playlist.name === event.target.value
    );
    this.props.doPlaylistUpdateActiveRequesting(playlist[0]);
    this.handleClose();
  };

  render() {
    const { classes, playlists, activePlaylist } = this.props;
    let activeIdx;

    let list = playlists.map((playlist, index) => {
      if (activePlaylist === playlist.id) activeIdx = index;

      return (
        <FormControlLabel
          classes={{ label: classes.label }}
          value={playlist.name}
          key={playlist.id}
          control={<MyRadio checked={activePlaylist === playlist.id} />}
          label={playlist.name}
        />
      );
    });

    return (
      <>
        <div className={classes.root}>
          <Tooltip
            classes={{ tooltip: classes.lightTooltip }}
            title={
              <React.Fragment>
                <Typography variant="body1" color="textPrimary">
                  Pressing the + icon over a movie automatically adds the title
                  to the current Active Playlist selected here
                </Typography>
              </React.Fragment>
            }
            placement="right-end"
            disableFocusListener
          >
            <Chip
              icon={<PlaylistPlayOutlinedIcon style={{ color: "#ecca00" }} />}
              label={`Active Playlist: ${
                activePlaylist ? playlists[activeIdx].name : ""
              }`}
              clickable
              className={classes.chip}
              onClick={this.handleClickOpen}
              variant="outlined"
            />
          </Tooltip>
        </div>
        <Dialog
          open={this.state.open}
          onClose={this.handleClose}
          PaperProps={{
            style: {
              backgroundImage: `url(${Image})`,
              borderStyle: "solid",
              borderColor: "#ecca00"
            }
          }}
        >
          <DialogTitle disableTypography>
            <Typography className={classes.title} variant="h6">
              Select Active Playlist
            </Typography>
          </DialogTitle>
          <DialogContent>
            <FormControl>
              <RadioGroup
                aria-label="active playlist"
                name="active playlist"
                onChange={event => {
                  this.handleChange(event, playlists);
                }}
              >
                {list}
              </RadioGroup>
            </FormControl>
          </DialogContent>
          <DialogActions>
            <Button onClick={this.handleClose} className={classes.button}>
              Cancel
            </Button>
          </DialogActions>
        </Dialog>
      </>
    );
  }
}

const mapStateToProps = state => ({
  playlists: getPlaylists(state),
  activePlaylist: getActivePlaylist(state)
});

export default connect(
  mapStateToProps,
  { doPlaylistUpdateActiveRequesting }
)(withStyles(styles)(ActivePlaylistContainer));
