class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def forgot_password
    command = GenerateTempPassword.call(params[:email])
    if command.success?
      id = User.find_by(email: command.email).id
      UserMailer.reset_password(command, id).deliver_now
    end

    render json: :ok
  end

  def reset_request
    command = VerifyTempPassword.call(request.headers, params[:id])
    if command.success?
      render json: :ok
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def change_password
    user = VerifyTempPassword.call(request.headers, params[:id]).result
    if user
      user.update(password: params[:password])
      render json: :accepted
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
