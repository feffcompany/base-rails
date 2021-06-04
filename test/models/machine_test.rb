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
require "test_helper"

class MachineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
