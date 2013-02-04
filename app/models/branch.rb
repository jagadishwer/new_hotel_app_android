# == Schema Information
#
# Table name: branches
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Branch < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :employees
end
