module ApiExceptions
  class AuthorizationError < ApiExceptions::BaseException
    class InvalidToken < ApiExceptions::AuthorizationError
    end
  end
end
