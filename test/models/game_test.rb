# == Schema Information
#
# Table name: games
#
#  id              :bigint           not null, primary key
#  title           :string
#  description     :text
#  release_date    :string
#  favorites_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end