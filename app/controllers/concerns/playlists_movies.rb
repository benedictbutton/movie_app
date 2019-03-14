module PlaylistsMovies
  extend ActiveSupport::Concern

  module ClassMethods

    def signin_setup(user)
      setup = {}
      @user = user
      setup[:active_id] = active_playlist_id
      setup[:all_movies] = all_playlists_movies
      setup[:movies] = active_playlist_movies
      setup[:playlists] = user.playlists
      return setup
    end

    def all_playlists_movies
      all_movie_ids = []
      playlists = @user.playlists
      playlists.each do |playlist|
        all_movie_ids += playlist.movies.pluck(:id)
      end
      all_movie_ids
    end

    def active_playlist_movies
      playlist = @user.playlists.find_by(active: true)
      movies = playlist.movies.pluck(:id) if playlist
      movies
    end

    def active_playlist_id
      @user.playlists.find_by(active: true)&.id
    end

    def playlists?
      !@user.playlists.empty?
    end

    def has_active_playlist?
      !@user.playlists.find_by(active: true).empty?
    end
  end
end





#     def self.calculate(line_item, vendor, time)
#
# new(line_item, vendor, time).calculate
#
# end
#
# attr_reader :line_item, :vendor, :time
#
# def initialize(line_item, vendor, time)
#
# @line_item = line_item
#
# @vendor = vendor
#
# @time = time
#
# @payout = 0
#
# end
#
# def calculate
#
# total_from_license if payable_from_music_license?
#
# add_fees if line_item.fees.any?
#
# rounded_total
#
# end
# 					etc.
#
