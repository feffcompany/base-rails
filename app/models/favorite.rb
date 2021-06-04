class Favorite < ApplicationRecord
  belongs_to :fan
  belongs_to :game
end
