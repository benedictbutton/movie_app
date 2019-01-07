class Api::V1::RatingsController < ApplicationController
  include Stars

  def index
    @ratings = Rating.all
    render json: { ratings: @ratings }
  end
end
