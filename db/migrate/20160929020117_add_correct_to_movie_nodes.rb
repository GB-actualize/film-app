class AddCorrectToMovieNodes < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_nodes, :correct, :boolean, default: false
  end
end
