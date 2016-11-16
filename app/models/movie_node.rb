class MovieNode < ApplicationRecord
  belongs_to :nodable, :polymorphic => true
  has_one :movie_node, :as => :nodable

  def all_nodes
    nodes = []
    current_node = MovieNode.find_by(nodable_id: id, nodable_type: "Game")

    nodes << current_node

    false_nodes = MovieNode.where(nodable_id: id, nodable_type: "MovieNode")
    false_nodes.each do |false_node|
      nodes << false_node
    end
    nodes
  end

  def next_right_answer
    all_nodes.select { |node| !node.correct }.first
  end

  def current_correct_answer
    all_nodes.select { |node| node.correct }.last
  end

  def update_node
    self.update(correct: true)
  end
    
end

