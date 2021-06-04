class Machine < ApplicationRecord
  belongs_to :arcade
  belongs_to :game
end
