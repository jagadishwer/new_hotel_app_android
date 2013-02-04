# == Schema Information
#
# Table name: orderlists
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  item_id     :integer
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cancel_item :boolean
#  counter_id  :integer
#  user_id     :integer
#  kitchen_id  :integer
#  status      :integer
#

require 'test_helper'

class OrderlistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
