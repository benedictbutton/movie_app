module ApiExceptions
  class PlaylistError < ApiExceptions::BaseException
    class NoActivePlaylist < ApiExceptions::PlaylistError
    end
  end
end
