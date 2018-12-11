class User < ApplicationRecord
  validates :email, uniqueness: {message: '%{attribute} has already been used to create an account'}

  has_secure_password
end
