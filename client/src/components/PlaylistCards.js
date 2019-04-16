import React, { Component } from "react";
import { Link, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { getPlaylistMovieIds } from "../redux/selectors/selectors";
import Image from "../assets/brushed-metal.jpg";
// material-ui
import AddCircleIcon from "@material-ui/icons/AddCircle";
import ButtonBase from "@material-ui/core/ButtonBase";
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
  }
});

class PlaylistCards extends Component {
  state = {
    open: false,
    vertical: "bottom",
    horizontal: "left"
  };

  handleClick = state => () => {
    this.setState({ open: true, ...state });
  };

  handleClose = event => {
    this.setState({ open: false });
  };

  render() {
    const { classes, handleClickOpen, playlistMovieIds } = this.props;

    const { vertical, horizontal, open } = this.state;
    const objKeys = Object.keys(playlistMovieIds);
    let playlists = this.props.playlists.lists.map(playlist => {
      let id = playlist.id.toString();
      return (
        <Grid item xs={6} md={4} lg={3} key={id} align="center">
          {objKeys.includes(id) ? (
            <Link to={`/ms/playlist/${id}`} style={{ textDecoration: "none" }}>
              <Paper className={classes.paper}>
                <Typography variant="h4" align="center">
                  {playlist.name}
                </Typography>
              </Paper>
            </Link>
          ) : (
            <ButtonBase
              className={classes.paper}
              component={Paper}
              onClick={this.handleClick({
                vertical: "bottom",
                horizontal: "left"
              })}
            >
              <Typography variant="h4" align="center">
                {playlist.name}
              </Typography>
            </ButtonBase>
          )}
        </Grid>
      );
    }, this.props.playlists.playlistMovieIds);

    return (
      <>
        <div>
          <div ref={node => (this.node = node)}>
            <Grid
              container
              spacing={16}
              className={classes.root}
              justify="flex-start"
              alignItems="flex-start"
            >
              <Grid item xs={6} md={4} lg={3} align="center">
                <Paper className={classes.paper}>
                  <Typography variant="h3" align="center">
                    Create Playlist
                  </Typography>
                  <IconButton
                    className={classes.button}
                    onClick={handleClickOpen}
                  >
                    <AddCircleIcon color="primary" fontSize="large" />
                  </IconButton>
                </Paper>
              </Grid>
              {playlists}
            </Grid>
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
        </div>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  playlists: state.playlists,
  playlistMovieIds: getPlaylistMovieIds(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(withStyles(styles)(PlaylistCards))
);
