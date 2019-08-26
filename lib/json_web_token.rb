class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue StandardError
      nil
    end

    def encode_temp(secret, payload, exp = 1.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, secret)
    end

    def decode_temp(secret, token)
      body = JWT.decode(token, secret)[0]
      HashWithIndifferentAccess.new body
    rescue JWT::ExpiredSignature, JWT::VerificationError
      raise ApiExceptions::AuthenticationError::ExpiredLink
    end
  end
end
