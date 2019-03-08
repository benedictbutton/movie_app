class MoviesPlaylist < ApplicationRecord
  belongs_to :playlist
  belongs_to :movie
end
