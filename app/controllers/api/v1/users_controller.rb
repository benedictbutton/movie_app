class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: { users: @users }
  end

  def create
    @user = User.new(user_params)

    if @user.save
       render json: @user, status: :created
     else
       render json: @user.errors, status: :unprocessable_entity
     end
  end
end
