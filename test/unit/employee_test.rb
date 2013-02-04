# == Schema Information
#
# Table name: employees
#
#  id          :integer          not null, primary key
#  position_id :integer
#  branch_id   :integer
#  first_name  :string(255)
#  last_name   :string(255)
#  employee_no :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
