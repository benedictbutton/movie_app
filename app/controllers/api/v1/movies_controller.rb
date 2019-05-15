class Api::V1::MoviesController < ApplicationController
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
    if Movie.exists?(params[:id])
      rating = Movie.existing_movie_rated(params, current_user)
      render json: rating, status: :created
    else
      movie = Movie.create_new_movie(params)
      if movie.save
        rating = Movie.create_new_rating(params, movie, current_user)
        render json: rating, status: :created
      else
        render json: movie.errors, status: :unprocessable_entity
      end
    end
  end

private

  def movie_params
    params.require(:movie).permit(:id, :title, :poster, :release_date, :description, :vote_count, :vote_rating)
  end
end
