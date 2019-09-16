class User < ApplicationRecord
  enum role: %i[regular admin]
  validates :email, uniqueness: {message: '%{attribute} has already been used to create an account'}

  has_secure_password
  has_many :ratings
  has_many :movies, :through => :ratings
  has_many :playlists
  has_many :movies, :through => :playlists
end
