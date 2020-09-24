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
    const { movie } = this.props.location.state;
    const mediaType = movie.media_type;
    const id =
      movie.id.toString().slice(0, 3) === "999"
        ? parseInt(movie.id.toString().slice(3))
        : movie.id;

    this.props.doCastRequesting(id, mediaType);
  }

  handlePlaylistClick = (check, activePlaylist, movie, id) => {
    check
      ? this.props.doPlaylistRemoveMovieRequesting(activePlaylist, id)
      : this.props.doPlaylistAddMovieRequesting(activePlaylist, movie, id);
  };

  handleRatingClick(id) {
    this.props.doRatingRemoveRequesting(id);
  }

  render() {
    const {
      activePlaylist,
      playlistMovieIds,
      playlistErrors,
      cast
    } = this.props;

    const { id, movie, imageUrl, profile } = this.props.location.state;

    let check =
      activePlaylist && playlistMovieIds[activePlaylist].includes(+id);

    return (
      <>
        <Movie
          id={id}
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
