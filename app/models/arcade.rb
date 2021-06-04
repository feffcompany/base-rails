class Arcade < ApplicationRecord
    belongs_to :owner, class_name: "User"

    has_many :games, through: :machines

    has_many :machines, dependent: :destroy

    has_many :comments, dependent: :destroy
end
