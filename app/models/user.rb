# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string
#  private                :boolean
#  favorite_count         :integer          default(0)
#  comments_count         :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, foreign_key: :author_id, dependent: :destroy

  has_many :favorites, foreign_key: :fan_id, dependent: :destroy

  has_many :own_arcades, foreign_key: :owner_id, class_name: "Arcade", dependent: :destroy

  has_many :favorited_games, through: :favorites, source: :game

  validates :username,
    presence: true,
    uniqueness: true,
    format: { 
      with: /\A[\w_\.]+\z/i,
      message: "can only contain letters, numbers, periods, and underscores"
    }

end
