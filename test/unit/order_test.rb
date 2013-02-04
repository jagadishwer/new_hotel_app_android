# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  total       :float
#  status      :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  counter_id  :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
