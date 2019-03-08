import React from "react";
import { connect } from "react-redux";
import {
  doPlaylistAddMovieRequesting,
  doPlaylistRemoveMovieRequesting
} from "../redux/actions/playlistActions";
import {
  getActivePlaylist,
  getPlaylistMovieIds,
  getMoviesAsIds
} from "../redux/selectors/selectors";
//material=ui
import Grid from "@material-ui/core/Grid";
import AddIcon from "@material-ui/icons/Add";
import CheckIcon from "@material-ui/icons/Check";
import IconButton from "@material-ui/core/IconButton";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  button: {
    "&:hover": {
      backgroundColor: "transparent"
    },
    paddingRight: 0,
    paddingTop: 0,
    marginTop: 0
  },
  icon: {
    background: "rgba(0, 0, 0, 0.5)",
    color: "white",
    marginLeft: theme.spacing.unit * 4
  }
});

const Add = props => {
  const { id, classes, activePlaylist, playlistMovieIds } = props;
  return (
    <Grid item align="right">
      {playlistMovieIds.includes(+id) ? (
        <IconButton
          className={classes.button}
          align="right"
          onClick={() => {
            props.doPlaylistRemoveMovieRequesting(activePlaylist, id);
          }}
        >
          <CheckIcon
            className={classes.icon}
            align="right"
            style={{ fontSize: 30 }}
          />
        </IconButton>
      ) : (
        <IconButton
          className={classes.button}
          align="right"
          onClick={() => {
            props.doPlaylistAddMovieRequesting(activePlaylist, props.movie);
          }}
        >
          <AddIcon
            className={classes.icon}
            align="right"
            style={{ fontSize: 30 }}
          />
        </IconButton>
      )}
    </Grid>
  );
};

const mapStateToProps = (state, props) => ({
  activePlaylist: getActivePlaylist(state),
  playlistMovieIds: getPlaylistMovieIds(state),
  movie: getMoviesAsIds(state, props.id)
});

export default connect(
  mapStateToProps,
  { doPlaylistAddMovieRequesting, doPlaylistRemoveMovieRequesting }
)(withStyles(styles)(Add));
