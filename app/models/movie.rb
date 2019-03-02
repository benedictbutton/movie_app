class Movie < ApplicationRecord
  has_many :ratings
  has_many :users, :through => :ratings
  has_many :playlists
  has_many :users, :through => :playlists
end
