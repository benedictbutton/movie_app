module Fixes
  extend ActiveSupport::Concern

  module ClassMethods




    def update_images(images)
      movies = []
      images.each do |item|
          movie = Movie.find(id)
          movie.update('poster_path': item[:poster_path])
          movies << movie
        end
        movies
    end

    def update_media_type(media)
      movies = []
      media.each do |item|
          movie = Movie.find(item[:id])
          movie.update('media_type': item[:media_type]) if movie
          movie ||= "#{item[:id]} not found"
          movies << movie
        end
        movies
    end

    def fix_tv_ratings(movies, unfound)
      movies.each do |movie|
        id = movie.id.to_s
        new_id = id.slice!(3,id.length)
        rating = Rating&.find_by(movie_id: new_id.to_i)
        rating.nil? ? unfound << movie : rating.update(movie_id: movie.id)
      end
      movies
    end
  end
end
