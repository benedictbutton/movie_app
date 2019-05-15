class Movie < ApplicationRecord
  include MovieRating

  has_many :ratings
  has_many :users, :through => :ratings
  has_many :movies_playlists
  has_many :playlists, :through => :movies_playlists
end
