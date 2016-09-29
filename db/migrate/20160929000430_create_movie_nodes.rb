class CreateMovieNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_nodes do |t|
      t.string :title
      t.integer :nodable_id
      t.string :nodable_type
      t.integer :movie_id
      t.string :connection_name
      t.string :connection_category

      t.timestamps
    end
  end
end
