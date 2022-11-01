class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password, *arg)
    @email = email
    @password = password
  end

  def call
    token = JsonWebToken.encode(user_id: user.id) if user
    {token: token, user: user}
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    raise ApiExceptions::AuthenticationError::InvalidCredentials.new unless user && user.authenticate(password)
    return user
  end
end
