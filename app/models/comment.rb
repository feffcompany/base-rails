class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", counter_cache: true
  belongs_to :arcade, counter_cache: true

  validates :body, presence: true
end
