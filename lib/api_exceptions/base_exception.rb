module ApiExceptions
  class BaseException < StandardError
    include ActiveModel::Serialization
    attr_reader :status, :code, :message

    ERROR_DESCRIPTION = proc { |code, message| { status: 'error', code: code, message: message } }
    ERROR_CODE_MAP = {
      'AuthenticationError::InvalidCredentials' => ERROR_DESCRIPTION.call(401, 'Incorrect email and/or password. Please try again.'),
      'AuthenticationError::ExpiredLink' => ERROR_DESCRIPTION.call(401, "Reset Password Link has expired. To receive a new one, please resubmit your account email through the 'Forgot Password' link on the Sign-In page."),
      'AuthorizationError::EmailDuplicate' =>
        ERROR_DESCRIPTION.call(400, 'Email has already been used to setup account. Please use a different email.'),
      'AuthorizationError::InvalidToken' =>
        ERROR_DESCRIPTION.call(4011, 'Invalid or expired token. Please sign-in again.'),
      'PlaylistError::NoExistingPlaylist' => ERROR_DESCRIPTION.call(4044, 'You have not yet created a playlist to add movies to.'),
      'PlaylistError::PlaylistEmpty' => ERROR_DESCRIPTION.call(4044, 'Playlist is empty'),
      'PlaylistError::NoActivePlaylist' => ERROR_DESCRIPTION.call(4044, 'You must first select an active playlist from the Active Playlist dropdown menu')
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
