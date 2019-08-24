class VerifyTempPassword
  prepend SimpleCommand

  def initialize(headers = {}, id)
    @headers = headers
    @id = id
  end

  def call
    user
  end

  private

  attr_reader :headers, :id

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    client = User.find(@id)
    secret = client.password_digest + '-' + client.created_at.strftime('%3N')
    @decoded_auth_token ||= JsonWebToken.decode_temp(secret, http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end
