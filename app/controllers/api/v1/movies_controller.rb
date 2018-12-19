class Api::V1::MoviesController < ApplicationController
  skip_before_action :authenticate_request, only: %i[new create]
  def create
    @movie = Movie.new(id: params[:id], title: params[:title], poster: params[:poster], release_date: params[:release_date], description: params[:description], vote_count: params[:vote_count], vote_rating: params[:vote_rating])
    if movie.save
      @rating = @movie.ratings.create(movie_id: @movie.id, user_id: @current_user.id, score: params[:score])
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end


private

  def movie_params
    params.require(:movie).permit(:id, :title, :poster, :release_date, :description, :vote_count, :vote_rating)
  end
end
