# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  arcade_id  :bigint           not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", counter_cache: true
  belongs_to :arcade, counter_cache: true

  validates :body, presence: true
end
