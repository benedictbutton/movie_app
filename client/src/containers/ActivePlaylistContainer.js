import React, { Component } from "react";
import { connect } from "react-redux";
import { doPlaylistUpdateActiveRequesting } from "../redux/actions/playlistActions";
import { getPlaylists, getActivePlaylist } from "../redux/selectors/selectors";
import Image from "../assets/brushed-metal.jpg";
//material-ui
import Input from "@material-ui/core/Input";
import Grid from "@material-ui/core/Grid";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import Tooltip from "@material-ui/core/Tooltip";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  font: {
    color: "#ecca00"
  },
  formControl: {
    minWidth: 120,
    maxWidth: 300
  },
  noLabel: {
    marginTop: theme.spacing.unit * 3
  },
  select: {
    borderStyle: "solid",
    borderColor: "#ecca00",
    paddingLeft: theme.spacing.unit
  },
  icon: {
    color: "#ecca00"
  },
  regular: {
    fontWeight: theme.typography.fontWeightRegular
  },
  medium: {
    fontWeight: theme.typography.fontWeightMedium
  },
  lightTooltip: {
    backgroundColor: theme.palette.common.white,
    boxShadow: theme.shadows[1]
  },
  type: {
    marginBottom: 0
  }
});

const ITEM_HEIGHT = 48;
const ITEM_PADDING_TOP = 8;
const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
      width: 250,
      backgroundImage: `url(${Image})`,
      borderStyle: "solid",
      borderColor: "#ecca00"
    }
  }
};

class ActivePlaylistContainer extends Component {
  handleChange = event => {
    this.props.doPlaylistUpdateActiveRequesting(event.target.value);
  };
  render() {
    const { classes, playlists, activePlaylist } = this.props;
    let empty = "";
    let activePlaylistIndex;

    let list = playlists.map((playlist, index) => {
      if (activePlaylist === playlist.id) activePlaylistIndex = index;
      return (
        <MenuItem
          key={playlist.id}
          color="primary"
          value={playlist}
          className={classes.medium}
        >
          <Typography className={classes.type} color="primary" variant="h6">
            {playlist.name}
          </Typography>
        </MenuItem>
      );
    });
    return (
      <>
        <Grid item xs={2}>
          <Typography variant="h6" className={classes.font}>
            <em>Active Playlist:</em>
          </Typography>
        </Grid>
        <Grid item xs={2} align="left">
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
          >
            <FormControl className={classes.formControl}>
              <Select
                classes={{ icon: classes.icon }}
                displayEmpty
                className={classes.select}
                value={playlists[activePlaylistIndex] || empty}
                onChange={this.handleChange}
                onSelect={this.handleSelect}
                input={
                  <Input id="select-multiple-placeholder" disableUnderline />
                }
                MenuProps={MenuProps}
              >
                <MenuItem disabled value="">
                  <Typography variant="h6" color="primary">
                    <em>None</em>
                  </Typography>
                </MenuItem>
                {list}
              </Select>
            </FormControl>
          </Tooltip>
        </Grid>
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
