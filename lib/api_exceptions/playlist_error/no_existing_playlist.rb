module ApiExceptions
  class PlaylistError < ApiExceptions::BaseException
    class NoExistingPlaylist < ApiExceptions::PlaylistError
    end
  end
end
