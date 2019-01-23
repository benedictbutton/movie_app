class Api::V1::RatingsController < ApplicationController
  include Stars

  def index
    @ratings = Rating.where(user_id: current_user.id)
    render json: { ratings: @ratings }
  end
end
