# == Schema Information
#
# Table name: delivery_items
#
#  id                 :integer          not null, primary key
#  stock_list_item_id :integer
#  delivery_id        :integer
#  mrp                :float
#  quantity           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  supplier_id        :integer
#  payment_status     :integer
#  user_id            :integer
#

require 'test_helper'

class DeliveryItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
