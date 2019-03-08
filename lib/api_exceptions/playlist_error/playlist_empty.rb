module ApiExceptions
  class PlaylistError < ApiExceptions::BaseException
    class PlaylistEmpty < ApiExceptions::PlaylistError
    end
  end
end
