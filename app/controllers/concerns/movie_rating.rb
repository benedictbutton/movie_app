module MovieRating
  extend ActiveSupport::Concern
  include Stars

  module ClassMethods

    def create_new_movie(params)
      if params[:title] then title = params[:title] else title = params[:name] end
      if params[:description] then description = params[:description] else description = params[:overview] end

      Movie.new(id: params[:id], title: title, poster_path: params[:poster_path], media_type: params[:media_type], release_date: params[:release_date], description: description, vote_count: params[:vote_count], vote_rating: params[:vote_rating])
    end

    def existing_movie_rated(params, user)
      movie = Movie.find(params[:id])
      if movie.ratings.find_by(user_id: user.id)
        rating = update_existing_rating(params, movie, user)
      else
        rating = create_new_rating(params, movie, user)
      end
      rating
    end

    def update_existing_rating(params, movie, user)
      stars = add_stars(params[:score])
      rating = movie.ratings.find_by(user_id: user.id)
      rating.update(score: params[:score], stars: stars)
      rating
    end

    def create_new_rating(params, movie, user)
      stars = add_stars(params[:score])
      rating = movie.ratings.create!(movie_id: movie.id, user_id: user.id, score: params[:score], stars: stars)
      rating
    end
  end
end
