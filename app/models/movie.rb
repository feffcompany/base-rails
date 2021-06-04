# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movie < ApplicationRecord
end
