module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from AuthorizationError::InvalidToken, with: :invalid_token
    rescue_from AuthorizationError::InvalidCredentials, with: :invalid_credentials
    rescue_from AuthenticationError::EmailDuplicate, with: :email_duplicate
  end
end
