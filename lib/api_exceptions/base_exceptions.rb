module ApiExceptions
  class BaseException < StandardError
    include ActiveModel::Serialization
    attr_reader :status, :code, :message

    ERROR_DESCRIPTION = proc { |code, message| { status: 'error | failure', code: code, message: message } }
    ERROR_CODE_MAP = {
      'AuthenticationError::InvalidToken' =>
        ERROR_DESCRIPTION.call(401, 'Invalid or expired token. Please sign-in again.'),
      'AuthenticationError::InvalidCredentials' => ERROR_DESCRIPTION.call(401, 'Incorrect email and/or password. Please try again.'),
      'AuthorizationError::EmailDuplicate' =>
        ERROR_DESCRIPTION.call(400, 'Email has already been used to setup account. Please use a different email.')
    }.freeze

    def initialize
      error_type = self.class.name.scan(/ApiExceptions::(.*)/).flatten.first
      ApiExceptions::BaseException::ERROR_CODE_MAP
        .fetch(error_type, {}).each do |attr, value|
        instance_variable_set("@#{attr}".to_sym, value)
      end
    end
  end
end
