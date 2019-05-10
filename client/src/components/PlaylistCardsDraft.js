import React, { Component } from "react";
import { Link, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { getPlaylistMovieIds } from "../redux/selectors/selectors";
import DeletePlaylist from "./DeletePlaylist";
import EmptyPlaylist from "./EmptyPlaylist";
import Image from "../assets/brushed-metal.jpg";
import NonEmptyPlaylist from "./NonEmptyPlaylist";
// material-ui
import AddCircleIcon from "@material-ui/icons/AddCircle";
import Fade from "@material-ui/core/Fade";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import IconButton from "@material-ui/core/IconButton";
import Snackbar from "@material-ui/core/Snackbar";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "space-around",
    overflow: "hidden"
  },
  grid: {
    width: 500,
    height: 450
  },
  snack: {
    color: "white",
    backgroundColor: theme.palette.primary.dark
  },
  tile: {
    background: `url(${Image})`,
    "&:hover": {
      borderStyle: "solid",
      borderColor: "#ecca00",
      borderWidth: 5
    }
  },
  type: {
    margin: theme.spacing.unit * 3
  }
});

class PlaylistCards extends Component {
  constructor(props) {
    super(props);
    this.state = {
      open: false,
      vertical: "bottom",
      horizontal: "left"
    };
  }

  handleClick = state => () => {
    this.setState({ open: true, ...state });
  };

  handleClose = event => {
    this.setState({ open: false });
  };

  render() {
    const { classes, handleClickOpen, playlistMovieIds } = this.props;

    const { vertical, horizontal, open } = this.state;
    let playlists = this.props.playlists.lists.map(playlist => {
      let id = playlist.id.toString();
      return playlistMovieIds[id].length !== 0 ? (
        <>
          <Link to={`/ms/playlist/${id}`} style={{ textDecoration: "none" }}>
            <NonEmptyPlaylist id={id} playlistName={playlist.name} />
          </Link>
        </>
      ) : (
        <EmptyPlaylist
          id={id}
          playlistName={playlist.name}
          handleClick={this.handleClick}
        />
      );
    }, this.props.playlists.playlistMovieIds);

    return (
      <>
        <div className={classes.root}>
          <GridList
            className={classes.grid}
            cellHeight={220}
            spacing={10}
            cols={2}
          >
            <GridListTile className={classes.tile} col={1}>
              <Typography className={classes.type} variant="h3" align="center">
                Create Playlist
              </Typography>
              <IconButton onClick={handleClickOpen}>
                <AddCircleIcon color="primary" fontSize="large" />
              </IconButton>
            </GridListTile>
            {playlists}
          </GridList>
        </div>
        <Snackbar
          className={classes.snack}
          anchorOrigin={{ vertical, horizontal }}
          autoHideDuration={3000}
          open={open}
          onClose={this.handleClose}
          ContentProps={{
            "aria-describedby": "message-id",
            className: classes.snack
          }}
          TransitionComponent={Fade}
          message={<span id="message-id"> Playlist is empty</span>}
        />
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  playlistMovieIds: getPlaylistMovieIds(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(withStyles(styles)(PlaylistCards))
);
