# == Schema Information
#
# Table name: abouts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class About < ActiveRecord::Base
 #  resourcify
  attr_accessible :description, :title
end
