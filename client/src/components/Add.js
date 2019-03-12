import React from "react";
import { withRouter } from "react-router-dom";
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
  let playlistId;
  const { id, classes, activePlaylist, playlistMovieIds } = props;

  // I should pass the appropriate key down from the containers instead of grabbing it from the store. Pain in my bug. TBC.
  if (
    props.location.pathname === "/ms/search" ||
    props.location.pathname === "/ms/ratings"
  )
    playlistId = "none";
  else if (props.location.pathname === "/ms/movies" && activePlaylist)
    playlistId = activePlaylist;
  else if (props.match.params.id) playlistId = props.match.params.id;
  else playlistId = "none";

  return (
    <Grid item align="right">
      {playlistMovieIds[playlistId].includes(+id) ? (
        <IconButton
          className={classes.button}
          align="right"
          onClick={() => {
            props.doPlaylistRemoveMovieRequesting(playlistId, id);
          }}
        >
          <CheckIcon
            className={classes.icon}
            align="right"
            style={{ fontSize: 32 }}
          />
        </IconButton>
      ) : (
        <IconButton
          className={classes.button}
          align="right"
          onClick={() => {
            props.doPlaylistAddMovieRequesting(playlistId, props.movie);
          }}
        >
          <AddIcon
            className={classes.icon}
            align="right"
            style={{ fontSize: 32 }}
          />
        </IconButton>
      )}
    </Grid>
  );
};

const mapStateToProps = (state, props) => ({
  activePlaylist: getActivePlaylist(state),
  playlistMovieIds: getPlaylistMovieIds(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doPlaylistAddMovieRequesting, doPlaylistRemoveMovieRequesting }
  )(withStyles(styles)(Add))
);
