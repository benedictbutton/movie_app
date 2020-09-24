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
    id = params[:id]
    params_movie = params[:movie]
    if Movie.exists?(id)
      rating = Movie.existing_movie_rated(id, params, current_user)
      render json: rating, status: :created
    else
      movie = Movie.create_new_movie(id, params_movie)
      if movie.save
        rating = Movie.create_new_rating(params, movie, current_user)
        render json: rating, status: :created
      else
        render json: movie.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    movies = params[:images] ? fix_images(params[:images]) :
      update_media_type(params[:media])
    render json: movies
  end

private

  def movie_params
    params.require(:movie).permit(:id, :title, :poster_path, :media_type, :release_date, :description, :vote_count, :vote_rating, :images)
  end
end


# if item[:id]
#   str = '999' + item[:id].to_s
#   id = item[:media_type] === 'tv' ?
#   str.to_i : item[:id]

# if item != '***'
#   str = '999' + item[:id].to_s
#   id = item[:media_type] === 'tv' ?
#   str.to_i : item[:id]
