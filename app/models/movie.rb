class Movie < ApplicationRecord
  belongs_to :movie_node


  def imdb_id
    @api_request = Unirest.get("http://www.omdbapi.com/?t=#{title}&y=&plot=full&r=json").body["imdbID"]
  end
end
