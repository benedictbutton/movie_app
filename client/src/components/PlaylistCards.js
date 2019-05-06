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
import Grid from "@material-ui/core/Grid";
import IconButton from "@material-ui/core/IconButton";
import Paper from "@material-ui/core/Paper";
import Snackbar from "@material-ui/core/Snackbar";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    flex: 1,
    flexWrap: "wrap",
    marginTop: theme.spacing.unit * 3,
    marginBottom: theme.spacing.unit * 3
  },
  grid: {
    marginBottom: theme.spacing.unit * 7
  },
  paper: {
    display: "table-cell",
    background: `url(${Image})`,
    width: 225,
    height: 300,
    verticalAlign: "middle",
    "&:hover": {
      borderStyle: "solid",
      borderColor: "#ecca00",
      borderWidth: 5
    }
  },
  snack: {
    color: "white",
    backgroundColor: theme.palette.primary.dark
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
      return (
        <Grid item xs={6} md={4} lg={3} key={id} align="center">
          {playlistMovieIds[id].length !== 0 ? (
            <>
              <Link
                to={`/ms/playlist/${id}`}
                style={{ textDecoration: "none" }}
              >
                <NonEmptyPlaylist id={id} playlistName={playlist.name} />
              </Link>
            </>
          ) : (
            <EmptyPlaylist
              id={id}
              playlistName={playlist.name}
              handleClick={this.handleClick}
            />
          )}
        </Grid>
      );
    }, this.props.playlists.playlistMovieIds);

    return (
      <>
        <Grid
          container
          spacing={16}
          className={classes.root}
          justify="flex-start"
          alignItems="flex-start"
        >
          <Grid
            item
            xs={6}
            md={4}
            lg={3}
            className={classes.grid}
            align="center"
          >
            <Paper className={classes.paper}>
              <Typography className={classes.type} variant="h3" align="center">
                Create Playlist
              </Typography>
              <IconButton className={classes.button} onClick={handleClickOpen}>
                <AddCircleIcon color="primary" fontSize="large" />
              </IconButton>
            </Paper>
          </Grid>
          {playlists}
        </Grid>
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
