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
require "test_helper"

class ArcadeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end