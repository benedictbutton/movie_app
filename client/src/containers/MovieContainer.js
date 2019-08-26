import React, { Component } from "react";
import { connect } from "react-redux";
import { withRouter } from "react-router-dom";
import {
  doPlaylistAddMovieRequesting,
  doPlaylistRemoveMovieRequesting
} from "../redux/actions/playlistActions";
import { doRatingRemoveRequesting } from "../redux/actions/ratingActions";
import {
  getRatingsList,
  getActivePlaylist,
  getPlaylistMovieIds
} from "../redux/selectors/selectors";
import Movie from "../components/Movie";

class MovieContainer extends Component {
  constructor(props) {
    super(props);
    this.handleRatingClick = this.handleRatingClick.bind(this);
  }

  handlePlaylistClick = (check, activePlaylist, movie) => {
    check
      ? this.props.doPlaylistRemoveMovieRequesting(activePlaylist, movie.id)
      : this.props.doPlaylistAddMovieRequesting(activePlaylist, movie);
  };

  handleRatingClick(movie) {
    let movieId = movie.id;
    this.props.doRatingRemoveRequesting(movieId);
  }

  render() {
    const { activePlaylist, playlistMovieIds } = this.props;
    const { movie, imageUrl } = this.props.location.state;
    let check =
      activePlaylist && playlistMovieIds[activePlaylist].includes(movie.id);

    return (
      <Movie
        movie={movie}
        imageUrl={imageUrl}
        check={check}
        handlePlaylistClick={this.handlePlaylistClick}
        handleRatingClick={this.handleRatingClick}
        activePlaylist={activePlaylist}
        playlistMovieIds={playlistMovieIds}
      />
    );
  }
}

const mapStateToProps = (state, props) => ({
  ratingsList: getRatingsList(state),
  activePlaylist: getActivePlaylist(state),
  playlistMovieIds: getPlaylistMovieIds(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    {
      doRatingRemoveRequesting,
      doPlaylistAddMovieRequesting,
      doPlaylistRemoveMovieRequesting
    }
  )(MovieContainer)
);
