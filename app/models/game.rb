class Game < ApplicationRecord
  belongs_to :user
  has_one :movie_node, as: :nodable

  def movie_compiler
    @movie_array = []
    @films[0].each do |film|
      @movie_array << film
    end
    @movie_array
  end 


  # @movie_nodes_user1 = @movie_nodes[1].title
  # @movie_nodes_user2 = @movie_nodes[5].title

  # game_array1 = [""]
  # game_array2 = [""]
  # game_array3 = [""]
end
