class Api::V1::UsersController < ApplicationController
  def create
    @rating = Rating.new

  end
end
