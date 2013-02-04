# == Schema Information
#
# Table name: customers
#
#  id                  :integer          not null, primary key
#  serial_no           :integer
#  date_of_transcation :date
#  total               :float
#  table_id            :integer
#  status              :integer
#  adjusted_total      :float
#  adjustment_reason   :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  counter_id          :integer
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
