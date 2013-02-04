# == Schema Information
#
# Table name: attendances
#
#  id           :integer          not null, primary key
#  employee_id  :integer
#  salary_id    :integer
#  day_1        :boolean
#  day_2        :boolean
#  day_3        :boolean
#  day_4        :boolean
#  day_5        :boolean
#  day_6        :boolean
#  day_7        :boolean
#  day_8        :boolean
#  day_9        :boolean
#  day_10       :boolean
#  day_11       :boolean
#  day_12       :boolean
#  day_13       :boolean
#  day_14       :boolean
#  day_15       :boolean
#  day_16       :boolean
#  day_17       :boolean
#  day_18       :boolean
#  day_19       :boolean
#  day_20       :boolean
#  day_21       :boolean
#  day_22       :boolean
#  day_23       :boolean
#  day_24       :boolean
#  day_25       :boolean
#  day_26       :boolean
#  day_27       :boolean
#  day_28       :boolean
#  day_29       :boolean
#  day_30       :boolean
#  day_31       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  total        :integer
#  target_year  :integer
#  target_month :integer
#

class Attendance < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :employee
  belongs_to :salary
  after_initialize :init
  def init
    #self.count ||= 15
    self.target_year ||= Time.now.year
    self.target_month ||= Time.now.month
  end
  def emp_name
    (Employee.find(employee.id)).full_name
  end
  def emp_no
    (Employee.find(employee.id)).employee_no
  end
end
