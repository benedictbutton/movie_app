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
      setup[:playlist_movies_by_id] = playlist_movies_by_id
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

    def playlist_movies_by_id
      playlist_movies = {}
      playlistIds = @user.playlists.pluck(:id)
      playlistIds.each do |id|
      movies = Playlist.find(id).movies.pluck(:id)
      playlist_movies[id] = movies
    end
      playlist_movies
    end

    def switch_active_playlist(user, id)
      @user = user
      @id = id
      switch_off_current_active_playlist
      Playlist.find(@id).update(active: true)
    end

    def switch_off_current_active_playlist
      old_id = active_playlist_id
      if old_id
      prior_active = Playlist.find(old_id)
      prior_active.update(active: false)
      end
    end

    def playlists?
      !@user.playlists.empty?
    end

    def has_active_playlist?
      !@user.playlists.find_by(active: true).empty?
    end
  end
end
