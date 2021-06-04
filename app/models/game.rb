# == Schema Information
#
# Table name: games
#
#  id              :bigint           not null, primary key
#  title           :string
#  description     :text
#  release_year    :string
#  favorites_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Game < ApplicationRecord
  has_many :fans, through: :favorites

  has_many :machines, dependent: :destroy

  has_many :arcades, through: :machines
end
