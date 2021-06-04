class Machine < ApplicationRecord
  belongs_to :arcade
  belongs_to :game

  validates :arcade_id, uniqueness: { scope: :game_id, message: "has already registered this game" }
end
