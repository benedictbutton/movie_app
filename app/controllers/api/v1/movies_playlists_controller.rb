class Api::V1::MoviesPlaylistsController < ApplicationController

  def destroy
    playlist = params[:payload][:playlistId]
    movie = params[:payload][:movieId]

    Playlist.find(playlist).movies.delete(movie)

    render json: movie, status: :accepted
  end
end
