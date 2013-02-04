# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  item_name   :string(255)
#  price       :float
#  description :text
#  category_id :integer
#  counter_id  :integer
#  kitchen_id  :integer
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
