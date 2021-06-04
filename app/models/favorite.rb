class Favorite < ApplicationRecord
  belongs_to :fan, class_name: "User", counter_cache: true
  belongs_to :game, counter_cache: true

  validates :fan_id, uniqueness: { scope: :game_id, message: "has already favorited this game" }
end
