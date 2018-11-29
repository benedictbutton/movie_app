class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[new create]

  def index
    @users = User.all
    render json: { users: @users }
  end

  def show; end

  def create
    @user = User.new(first_name: params[:firstName], last_name: params[:lastName], username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
       params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
   end
end
