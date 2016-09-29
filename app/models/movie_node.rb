class MovieNode < ApplicationRecord
  belongs_to :nodable, :polymorphic => true
  has_one :movie_node, :as => :nodable
  has_many :movies

end
