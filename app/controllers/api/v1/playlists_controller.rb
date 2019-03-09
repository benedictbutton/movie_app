class Api::V1::PlaylistsController < ApplicationController

  def index
    @playlists = current_user.playlists
    render json: @playlists
  end

  def show
    @movies = Playlist.find(params[:id]).movies
    raise ApiExceptions::PlaylistError::PlaylistEmpty.new if @movies.empty?
    render json: @movies, status: :accepted
  end

  def create
    # move method to model tomorrow
    # if params[:active] == true && current_user.playlists.exists?
    #   prior_active = Playlist.find_by(user_id: current_user.id, active: true)
    #   prior_active.update(active: false)
    # end
    @playlist = Playlist.new(name: params[:title], user_id: current_user.id, active: params[:active])
    if @playlist.save!
      render json: @playlist, status: :created
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  def update
    raise ApiExceptions::PlaylistError::NoExistingPlaylist.new if !current_user.playlists.exists?

    playlist = params[:payload][:playlist]
    movie = params[:payload][:movie]
    id = movie[:id]

    @playlist = Playlist.find(playlist)
    @movie = Movie.exists?(movie[:id]) ? Movie.find(movie[:id]) :
      Movie.create!(id: movie[:id], title: movie[:title], poster_path: movie[:poster_path], release_date: params[:release_date], description: movie[:overview], vote_count: movie[:vote_count], vote_rating: movie[:vote_rating])
    @playlist.movies_playlists.create!(movie: @movie)
    render json: id, status: :accepted
  end

  def active
    if current_user.playlists.exists?
      playlist = current_user.playlists.find_by(active: true)
      movies = playlist.movies.pluck(:id)
      render json: {playlist: playlist, movies: movies}, status: :accepted
    else
      render json: nil, status: :accepted
    end
  end
end
