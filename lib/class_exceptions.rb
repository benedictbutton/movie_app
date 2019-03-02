module ApiExceptions
  class AuthenticationError < ApiExceptions::BaseException
    class InvalidCredentials < ApiExceptions::AuthenticationError
    end
  end
  class AuthorizationError < ApiExceptions::BaseException
    class InvalidToken < ApiExceptions::AuthorizationError
    end
  end
end
