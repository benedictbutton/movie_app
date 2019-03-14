class Api::V1::MoviesPlaylistsController < ApplicationController

  def destroy
    playlistId = params[:payload][:playlistId]
    movieId = params[:payload][:movieId]

    Playlist.find(playlistId).movies.delete(movieId)

    render json: {playlistId: playlistId, movieId: movieId}, status: :accepted
  end
end
