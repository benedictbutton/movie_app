class Api::V1::PlaylistsController < ApplicationController

  def index
    @playlists = current_user.playlists
    render json: @playlists
  end

  def show
    playlistId = params[:id]
    @movies = Playlist.find(playlistId).movies
    raise ApiExceptions::PlaylistError::PlaylistEmpty.new if @movies.empty?
    render json: {movies: @movies, playlistId: playlistId}, status: :accepted
  end

  def create
    #move method to model tomorrow
    Playlist.switch_off_current_active_playlist(current_user) if params[:active]
    playlist = Playlist.new(name: params[:title], user_id: current_user.id, active: params[:active])
    if playlist.save!
      render json: playlist, status: :created
    else
      render json: playlist.errors, status: :unprocessable_entity
    end
  end

  def update
    raise ApiExceptions::PlaylistError::NoExistingPlaylist.new if !current_user.playlists.exists?
    raise ApiExceptions::PlaylistError::NoActivePlaylist.new if !current_user.playlists.find_by(active: true)

    playlist = params[:payload][:playlist]
    movie = params[:payload][:movie]
    id = movie[:id]

    @playlist = Playlist.find(playlist)
    @movie = Movie.exists?(movie[:id]) ? Movie.find(movie[:id]) :
    Movie.create_new_movie(movie)
    @playlist.movies_playlists.create!(movie: @movie)
    render json: {playlistId: playlist, movieId: id}, status: :accepted
  end

  def destroy
    removedPlaylistId = params['payload']
    playlist = Playlist.find(removedPlaylistId)
    playlist.destroy
    render json: {removedPlaylistId: removedPlaylistId}
  end

  def images
    movie_images = Playlist.find_all_movie_images(params[:id])
    render json: {images: movie_images}
  end

  def active
    id = params[:playlist][:id]
    Playlist.switch_active_playlist(current_user, id)
    movies = Playlist.active_playlist_movies || []
    render json: {playlist: id, movies: movies}, status: :accepted
  end

  def setup
    existing_playlists_data = Playlist.signin_setup(current_user)
    render json: existing_playlists_data, status: :accepted
  end
end
