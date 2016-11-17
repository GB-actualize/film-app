class Movie < ApplicationRecord
  has_many :movie_nodes 

  def db_movie
    Tmdb::Search.movie("#{title}", include_adult: false)['results']
  end
end
