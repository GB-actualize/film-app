class Movie < ApplicationRecord
  belongs_to :movie_node

  def actors_array
    @api_request["Actors"].to_s
  end

end
