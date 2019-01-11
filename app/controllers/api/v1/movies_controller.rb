class Api::V1::MoviesController < ApplicationController
  include Stars
  # skip_before_action :authenticate_request, only: %i[new create] (authenticating might be useful)

  def index
    movies = []
    ratings = Rating.where(user_id: @current_user.id)
    ratings.each do |movie|
      movies << Movie.find(movie.movie_id)
    end
    render json: movies
  end

  def create
    score = params[:score]
    stars = Rating.add_stars(score)
    if Movie.exists?(params[:id])
      @movie = Movie.find(params[:id])
      if @movie.ratings.find_by(user_id: @current_user.id)
        @rating = @movie.ratings.find_by(user_id: @current_user.id)
        @rating.update(score: params[:score], stars: stars)
      else
        @rating = @movie.ratings.create!(movie_id: @movie.id, user_id: @current_user.id, score: params[:score], stars: stars)
      end
      render json: @rating, status: :created
    else
      @movie = Movie.new(id: params[:id], title: params[:title], poster_path: params[:poster_path], release_date: params[:release_date], description: params[:description], vote_count: params[:vote_count], vote_rating: params[:vote_rating])
      if @movie.save
        @rating = @movie.ratings.create(movie_id: @movie.id, user_id: @current_user.id, score: params[:score], stars: stars)
        render json: @rating, status: :created
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end
  end


private

  def movie_params
    params.require(:movie).permit(:id, :title, :poster, :release_date, :description, :vote_count, :vote_rating)
  end
end
