import React, { Component } from "react";
import { Link, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import Image from "../assets/brushed-metal.jpg";
// material-ui
import AddCircleIcon from "@material-ui/icons/AddCircle";
import IconButton from "@material-ui/core/IconButton";
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
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
  }
});

class PlaylistCards extends Component {
  render() {
    const { classes, handleClickOpen } = this.props;
    let playlists = this.props.playlists.lists.map(playlist => {
      let id = playlist.id;
      return (
        <Grid item xs={6} md={4} lg={3} key={id} align="center">
          <Link to={`/ms/playlist/${id}`} style={{ textDecoration: "none" }}>
            <Paper className={classes.paper}>
              <Typography variant="h4" align="center">
                {playlist.name}
              </Typography>
            </Paper>
          </Link>
        </Grid>
      );
    });
    return (
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
            <IconButton className={classes.button} onClick={handleClickOpen}>
              <AddCircleIcon color="primary" fontSize="large" />
            </IconButton>
          </Paper>
        </Grid>
        {playlists}
      </Grid>
    );
  }
}

const mapStateToProps = (state, props) => ({
  playlists: state.playlists
});

export default withRouter(
  connect(
    mapStateToProps,
    null
  )(withStyles(styles)(PlaylistCards))
);
