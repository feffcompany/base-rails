# == Schema Information
#
# Table name: arcades
#
#  id             :bigint           not null, primary key
#  name           :string
#  address        :text
#  owner_id       :bigint           not null
#  comments_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Arcade < ApplicationRecord
    belongs_to :owner, class_name: "User"

    has_many :games, through: :machines

    has_many :machines, dependent: :destroy

    has_many :comments, dependent: :destroy
end
