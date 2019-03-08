module ApiExceptions
  class BaseException < StandardError
    include ActiveModel::Serialization
    attr_reader :status, :code, :message

    ERROR_DESCRIPTION = proc { |code, message| { status: 'error | failure', code: code, message: message } }
    ERROR_CODE_MAP = {
      'AuthenticationError::InvalidCredentials' =>  ERROR_DESCRIPTION.call(401, 'Incorrect email and/or password. Please try again.'),
      'AuthorizationError::EmailDuplicate' =>
        ERROR_DESCRIPTION.call(400, 'Email has already been used to setup account. Please use a different email.'),
      'AuthorizationError::InvalidToken' =>
        ERROR_DESCRIPTION.call(401, 'Invalid or expired token. Please sign-in again.'),
        'PlaylistError::NoExistingPlaylist' =>  ERROR_DESCRIPTION.call(404, 'You have not yet created a playlist to add movies to.'),
        'PlaylistError::PlaylistEmpty' =>  ERROR_DESCRIPTION.call(4044, 'Playlist is empty'),

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