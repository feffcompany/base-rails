# == Schema Information
#
# Table name: machines
#
#  id                 :bigint           not null, primary key
#  arcade_id          :bigint           not null
#  game_id            :bigint           not null
#  number_of_machines :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Machine < ApplicationRecord
  belongs_to :arcade
  belongs_to :game

  validates :arcade_id, uniqueness: { scope: :game_id, message: "has already registered this game" }
end
