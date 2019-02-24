module ApiExceptions
  class AuthenticationError < ApiExceptions::BaseException
    class InvalidToken < ApiExceptions::AuthenticationError
    end
    class InvalidCredentials < ApiExceptions::AuthenticationError
    end
  end

  class AuthorizationError < ApiExceptions::BaseException
    class EmailDuplicate < ApiExceptions::AuthorizationError
    end
  end
end  
