# == Schema Information
#
# Table name: taxes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  percentage :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tax < ActiveRecord::Base
   resourcify
  # attr_accessible :title, :body
end
