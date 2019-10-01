module ApiExceptions
  class AuthenticationError < ApiExceptions::BaseException
    class InvalidCredentials < ApiExceptions::AuthenticationError
    end
  end
end
