class GenerateTempPassword
  prepend SimpleCommand

  def initialize(email)
    @email = email
  end

  def call
    payload = {user_id: user.id}
    secret = user.password_digest + '-' + user.created_at.strftime("%3N")
    JsonWebToken.encode_temp(secret, payload) if user
  end

  attr_accessor :email

  def user
    user = User.find_by_email(email)
    return user
  end

end
