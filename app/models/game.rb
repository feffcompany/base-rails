class Game < ApplicationRecord
  has_many :fans, through: :favorites

  has_many :machines, dependent: :destroy

  has_many :arcades, through: :machines
end
