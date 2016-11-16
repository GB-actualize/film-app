class ChangeMovieIdToPosterId < ActiveRecord::Migration[5.0]
  def change
    rename_column :movie_nodes, :movie_id, :poster_id
  end
end
