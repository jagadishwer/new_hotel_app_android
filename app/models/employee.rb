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

class Employee < ActiveRecord::Base
  attr_accessible :position_id, :branch_id, :first_name, :last_name, :employee_no
  validates :first_name, :last_name, :position_id, :branch_id, :presence => true
  belongs_to :position
  belongs_to :branch
  has_many :salaries, :through=>:attendances
  has_many :attendances
  before_create :generate_employee_id
  def full_name
    self.first_name + " "+ self.last_name
  end
  def branch_name
    Branch.find(self.branch_id).name
  end
  private
  def generate_employee_id
    self.employee_no = self.branch_name.slice(0..2).upcase + Time.now.year.to_s + "#{(rand()*1000).to_i}"
  end
end
