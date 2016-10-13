class AddFirstTitleToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :first_title, :string
  end
end
