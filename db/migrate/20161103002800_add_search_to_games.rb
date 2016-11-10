class AddSearchToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :search, :string
  end
end
