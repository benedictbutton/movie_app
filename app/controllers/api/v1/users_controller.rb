class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render json: { users: @users }
  end

  def show
    binding.pry
  end

  def create
    binding.pry
    @user = User.new(user_params)

    if @user.save
       render json: @user, status: :created
     else
       render json: @user.errors, status: :unprocessable_entity
    end
  end

end
