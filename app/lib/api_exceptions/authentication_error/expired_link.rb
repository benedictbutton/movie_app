module ApiExceptions
  class AuthenticationError < ApiExceptions::BaseException
    class ExpiredLink < ApiExceptions::AuthenticationError
    end
  end
end
