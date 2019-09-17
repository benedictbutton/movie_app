class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[new create]

  def index
    if @current_user.admin?
      @users = User.all
    else
      @users = []
      count = 15
      while count > 0
        @users << {id: count, username: "sampleUser#{count}", email: "sampleUser#{count}@email.com"}
        count -= 1
      end
    end
    render json: { users: @users }
  end

  def show
    render json: @current_user
  end

  def create
    @user = User.new(first_name: params[:firstName], last_name: params[:lastName], username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      command = AuthenticateUser.call(@user.email, @user.password)
      render json: { auth_token: command.result }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    params[:records].each do |record|
      User.find(record).destroy unless !@current_user.admin?
    end
    render json: :ok
  end

  private

  def user_params
   params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
