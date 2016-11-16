class User < ApplicationRecord
  has_secure_password
  has_many :games

  def activated_games
    games.where("status = ?", "Activated")
  end

  def completed_games
    games.where("status = ?", "Completed")
  end
end