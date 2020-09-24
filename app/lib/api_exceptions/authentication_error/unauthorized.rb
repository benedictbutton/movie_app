module ApiExceptions
  class AuthenticationError < ApiExceptions::BaseException
    class Unauthorized < ApiExceptions::AuthenticationError
    end
  end
end
