import React, { Component } from "react";
import { connect } from "react-redux";
import { doMoviesRequesting } from "../redux/actions/movieActions";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
//material-ui
import Input from "@material-ui/core/Input";
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
  formControl: {
    margin: theme.spacing.unit,
    minWidth: 120,
    maxWidth: 300
  },
  noLabel: {
    marginTop: theme.spacing.unit * 3
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
      width: 250
    }
  }
};

const genreList = ["Drama", "Comedy", "Action", "Documentary", "SciFi"];

class GenreContainer extends Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      genreName: []
    };
  }

  handleChange(event) {
    this.setState({ genreName: event.target.value });
    this.props.doMoviesRequesting(event.target.value);
  }

  render() {
    const { classes } = this.props;

    let genres = genreList.map(genre => {
      return (
        <MenuItem
          key={genre}
          value={genre}
          className={
            genreList.indexOf(genre) === -1 ? classes.regular : classes.medium
          }
        >
          <Typography color="primary" variant="h6">
            {genre}
          </Typography>
        </MenuItem>
      );
    });
    return (
      <div className={classes.root}>
        <FormControl className={classes.formControl}>
          <Select
            displayEmpty
            value={this.state.genreName}
            onChange={this.handleChange}
            onSelect={this.handleSelect}
            input={<Input id="select-multiple-placeholder" />}
            MenuProps={MenuProps}
          >
            <MenuItem disabled value="">
              <Typography color="primary" variant="h6">
                <em color="primary">Genres </em>
                <FontAwesomeIcon color="blue" icon="sort-down" />
              </Typography>
            </MenuItem>
            {genres}
          </Select>
        </FormControl>
      </div>
    );
  }
}

export default connect(
  null,
  { doMoviesRequesting }
)(withStyles(styles)(GenreContainer));
