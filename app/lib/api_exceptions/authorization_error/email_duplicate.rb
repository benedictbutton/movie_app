module ApiExceptions
  class AuthorizationError < ApiExceptions::BaseException
    class EmailDuplicate < ApiExceptions::AuthorizationError
    end
  end
end
