# == Schema Information
#
# Table name: salaries
#
#  id              :integer          not null, primary key
#  working_days    :integer
#  basic_salary    :float
#  travel_expense  :float
#  other_expense   :float
#  total_payable   :float
#  day_rate        :float
#  other_decuction :float
#  net_payable     :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  target_year     :integer
#  target_month    :integer
#  employee_id     :integer
#

class Salary < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :employee
  has_one :attendances
  def emp_name
    (Employee.find(employee.id)).full_name
  end
  def emp_no
    (Employee.find(employee.id)).employee_no
  end
end
