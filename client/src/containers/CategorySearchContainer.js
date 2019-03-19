import React, { Component } from "react";
import { Redirect, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import { doMovieCategoryRequesting } from "../redux/actions/movieActions";
import { doPlaylistUpdateActiveRequesting } from "../redux/actions/playlistActions";
import { getPlaylists, getActivePlaylist } from "../redux/selectors/selectors";
import Image from "../assets/brushed-metal.jpg";
//material-ui
import Input from "@material-ui/core/Input";
import Grid from "@material-ui/core/Grid";
import MenuItem from "@material-ui/core/MenuItem";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";

const styles = theme => ({
  root: {
    display: "flex",
    flexWrap: "wrap"
  },
  font: { color: "#ecca00" },
  formControl: {
    margin: theme.spacing.unit,
    minWidth: 120,
    maxWidth: 300
  },
  noLabel: {
    marginTop: theme.spacing.unit * 3
  },
  select: {
    "&:before": {
      borderColor: "#ecca00"
    }
  },
  icon: {
    color: "#ecca00"
  },
  regular: {
    fontWeight: theme.typography.fontWeightRegular
  },
  medium: {
    fontWeight: theme.typography.fontWeightMedium
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

class CategorySearchContainer extends Component {
  render() {
    const { classes } = this.props;

    const categoryList = {
      genre: "Genre",
      "trending/all/week": "Trending",
      "movie/top_rated": "Top Rated",
      "movie/popular": "Popular",
      "movie/now_playing": "In Theaters",
      "movie/upcoming": "Upcoming"
    };

    // "movie/latest": "Latest",

    let list = Object.keys(categoryList).map((category, index) => {
      return (
        <MenuItem
          key={index}
          color="primary"
          value={category}
          className={classes.medium}
        >
          <Typography className={classes.type} color="primary" variant="h6">
            {categoryList[category]}
          </Typography>
        </MenuItem>
      );
    });
    return (
      <div className={classes.root}>
        <Grid container>
          <Grid item>
            <FormControl className={classes.formControl}>
              <Select
                classes={{ icon: classes.icon }}
                displayEmpty
                className={classes.select}
                value={this.props.categoryName}
                onChange={this.props.handleChange}
                onSelect={this.handleSelect}
                input={<Input id="select-multiple-placeholder" />}
                MenuProps={MenuProps}
              >
                <MenuItem disabled value="">
                  <Typography className={classes.font} variant="h6">
                    <em>Search</em>
                  </Typography>
                </MenuItem>
                {list}
              </Select>
            </FormControl>
          </Grid>
        </Grid>
      </div>
    );
  }
}

const mapStateToProps = state => ({
  playlists: getPlaylists(state),
  activePlaylist: getActivePlaylist(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    { doMovieCategoryRequesting, doPlaylistUpdateActiveRequesting }
  )(withStyles(styles)(CategorySearchContainer))
);
