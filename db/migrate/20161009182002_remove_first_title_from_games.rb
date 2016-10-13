class RemoveFirstTitleFromGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :first_title, :string
  end
end
