# == Schema Information
#
# Table name: internal_orders
#
#  id                 :integer          not null, primary key
#  kitchen_id         :integer
#  stock_list_item_id :integer
#  quantity           :integer
#  status             :integer
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class InternalOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
