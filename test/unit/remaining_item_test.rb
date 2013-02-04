# == Schema Information
#
# Table name: remaining_items
#
#  id                 :integer          not null, primary key
#  stock_list_item_id :integer
#  stock_count_id     :integer
#  quantity           :integer
#  mrp                :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#

require 'test_helper'

class RemainingItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
