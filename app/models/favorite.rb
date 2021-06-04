# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  fan_id     :bigint           not null
#  game_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Favorite < ApplicationRecord
  belongs_to :fan, class_name: "User", counter_cache: true
  belongs_to :game, counter_cache: true

  validates :fan_id, uniqueness: { scope: :game_id, message: "has already favorited this game" }
end
