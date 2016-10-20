class Game < ApplicationRecord
  belongs_to :user
  has_one :movie_node, as: :nodable

  def all_nodes
    nodes = [] 
    nodes << MovieNode.find_by(nodable_id: id, nodable_type: "Game")
    5.times do 
      nodes << MovieNode.find_by(nodable_id: nodes.last.id, nodable_type: "MovieNode")
    end
    nodes
  end

  def make_nodes
      movies = Movie.all.shuffle.to_a
      movie = movies.pop
      movie_node = MovieNode.create(nodable_id: id,
                                    nodable_type: "Game",
                                    title: movie.title,
                                    correct: true)

      5.times do 
        movie = movies.pop
        movie_node = MovieNode.create(nodable_id: movie_node.id,
                                      nodable_type: "MovieNode",
                                      title: movie.title)


    end
  end

  def find_next
    all_nodes.find { |node| node.correct == false }
  end

  def update_node
    if find_next
      find_next.update(correct: true)
    else 
      false
    end
  end

  # def finish_game 
  #   Game.last.update(status: "Completed")
  # end

end
