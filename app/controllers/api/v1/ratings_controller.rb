class Api::V1::RatingsController < ApplicationController

  def index
    @ratings = Rating.where(user_id: current_user.id)
    render json: { ratings: @ratings }
  end

  def update
    all_ratings = current_user.ratings
    all_ratings.each do |rating|
      if rating.stars.nil? || rating.stars == []
        stars = Rating.add_stars(rating.score)
        rating.update(stars: stars)
      end
    end
    render json: :accepted
  end

  def destroy
    movieId = params[:id]
    ratings = User.find(current_user[:id]).ratings
    rating = ratings.where(movie_id: movieId)
    rating[0].destroy
    render json: {movieId: movieId}, status: :accepted
  end

end
