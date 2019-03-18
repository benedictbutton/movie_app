class Playlist < ApplicationRecord
  include PlaylistsMovies

  belongs_to :user
  has_many :movies_playlists
  has_many :movies, :through => :movies_playlists

end
