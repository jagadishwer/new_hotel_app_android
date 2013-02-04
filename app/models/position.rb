# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Position < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :employees
end
