import React, { Component } from "react";
import { connect } from "react-redux";
import {
  doMoviesRequesting,
  doUpdateGenre
} from "../redux/actions/movieActions";
import Image from "../assets/grey-large-menu.jpg";
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
      backgroundImage: `url(${Image})`
    }
  }
};

const genreList = {
  18: "Drama",
  53: "Thriller",
  10749: "Romance",
  35: "Comedy",
  28: "Action",
  99: "Documentary",
  878: "SciFi",
  27: "Horror"
};

class GenreContainer extends Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      genreName: "",
      page: 0
    };
  }

  handleChange(event) {
    this.setState({ genreName: event.target.value });
    let payload = { page: 0, genre: event.target.value };
    this.props.doUpdateGenre(payload);
    this.props.doMoviesRequesting(payload);
  }

  render() {
    const { classes } = this.props;
    let genres = Object.keys(genreList).map(genre => {
      return (
        <MenuItem
          key={genre}
          color="#ecca00"
          value={genre}
          className={classes.medium}
        >
          <Typography color="primary" variant="h6">
            {genreList[genre]}
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
                value={this.state.genreName}
                onChange={this.handleChange}
                onSelect={this.handleSelect}
                input={<Input id="select-multiple-placeholder" />}
                MenuProps={MenuProps}
              >
                <MenuItem disabled value="">
                  <Typography className={classes.font} variant="h6">
                    <em>Genres </em>
                  </Typography>
                </MenuItem>
                {genres}
              </Select>
            </FormControl>
          </Grid>
        </Grid>
      </div>
    );
  }
}

export default connect(
  null,
  { doMoviesRequesting, doUpdateGenre }
)(withStyles(styles)(GenreContainer));
