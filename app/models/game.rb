class Game < ApplicationRecord
  belongs_to :user
  has_one :movie_node, as: :nodable
end
