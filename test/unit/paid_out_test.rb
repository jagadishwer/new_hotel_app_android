# == Schema Information
#
# Table name: paid_outs
#
#  id         :integer          not null, primary key
#  amount     :float
#  reason     :string(255)
#  to         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class PaidOutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
