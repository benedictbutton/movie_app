class ApplicationController < ActionController::API
  before_action :authenticate_request
  rescue_from ApiExceptions::BaseException,
    :with => :render_error_response

    attr_reader :current_user

  def render_error_response(error)
    render json: error, serializer: ApiExceptionSerializer, status: 200
  end

    private

    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      raise ApiExceptions::AuthorizationError::InvalidToken.new unless @current_user
    end
end
