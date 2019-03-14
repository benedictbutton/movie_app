class Api::V1::PlaylistsController < ApplicationController
  include PlaylistsMovies

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
    if params[:active] == true && current_user.playlists.exists? && current_user.playlists.find_by(active: true)
      prior_active = Playlist.find_by(user_id: current_user.id, active: true)
      prior_active.update(active: false)
    end
    @playlist = Playlist.new(name: params[:title], user_id: current_user.id, active: params[:active])
    if @playlist.save!
      render json: @playlist, status: :created
    else
      render json: @playlist.errors, status: :unprocessable_entity
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
      Movie.create!(id: movie[:id], title: movie[:title], poster_path: movie[:poster_path], release_date: params[:release_date], description: movie[:overview], vote_count: movie[:vote_count], vote_rating: movie[:vote_rating])
    @playlist.movies_playlists.create!(movie: @movie)
    render json: {playlistId: playlist, movieId: id}, status: :accepted
  end

  def active
    if current_user.playlists.find_by(active: true)
      prior_active = Playlist.find_by(user_id: current_user.id, active: true)
      prior_active.update(active: false)
    end
    playlists = current_user.playlists
    id = params[:playlist][:id]
    Playlist.find(id).update(active: true)
    if playlists.find_by(active: true).movies
    movies = playlists.find_by(active: true).movies.pluck(:id)
    else
    movies = []
    end

    render json: {playlist: id, movies: movies}, status: :accepted
  end

  def setup
    existing_playlists_data = Playlist.signin_setup(current_user)
    render json: existing_playlists_data, status: :accepted
  end
end
