import React, { Component } from "react";
import { connect } from "react-redux";
import { withRouter } from "react-router-dom";
import { doCastRequesting } from "../redux/actions/movieActions";
import {
  doPlaylistAddMovieRequesting,
  doPlaylistRemoveMovieRequesting
} from "../redux/actions/playlistActions";
import { doRatingRemoveRequesting } from "../redux/actions/ratingActions";
import {
  getRatingsList,
  getActivePlaylist,
  getPlaylistMovieIds,
  getPlaylistErrors,
  getCast
} from "../redux/selectors/selectors";
import Movie from "../components/Movie";
import Notifications from "../components/Notifications";

class MovieContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cast: []
    };
    this.handleRatingClick = this.handleRatingClick.bind(this);
  }

  componentDidMount() {
    let mediaType = this.props.location.state.movie.media_type
      ? this.props.location.state.movie.media_type
      : "movie";
    this.props.doCastRequesting(this.props.location.state.movie.id, mediaType);
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
    const {
      activePlaylist,
      playlistMovieIds,
      playlistErrors,
      cast
    } = this.props;
    const { movie, imageUrl, profile } = this.props.location.state;
    let check =
      activePlaylist && playlistMovieIds[activePlaylist].includes(movie.id);

    return (
      <>
        <Movie
          movie={movie}
          profile={profile}
          cast={cast}
          imageUrl={imageUrl}
          check={check}
          handlePlaylistClick={this.handlePlaylistClick}
          handleRatingClick={this.handleRatingClick}
          activePlaylist={activePlaylist}
          playlistMovieIds={playlistMovieIds}
        />
        <Notifications>{playlistErrors}</Notifications>
      </>
    );
  }
}

const mapStateToProps = (state, props) => ({
  ratingsList: getRatingsList(state),
  activePlaylist: getActivePlaylist(state),
  playlistMovieIds: getPlaylistMovieIds(state),
  playlistErrors: getPlaylistErrors(state),
  cast: getCast(state)
});

export default withRouter(
  connect(
    mapStateToProps,
    {
      doCastRequesting,
      doRatingRemoveRequesting,
      doPlaylistAddMovieRequesting,
      doPlaylistRemoveMovieRequesting
    }
  )(MovieContainer)
);
