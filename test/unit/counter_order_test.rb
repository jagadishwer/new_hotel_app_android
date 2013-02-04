# == Schema Information
#
# Table name: counter_orders
#
#  id         :integer          not null, primary key
#  counter_id :integer
#  item_id    :integer
#  quantity   :integer
#  status     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CounterOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
