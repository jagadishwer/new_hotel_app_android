# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Gallery < ActiveRecord::Base
   resourcify
  attr_accessible :description, :title, :images_attributes
  has_many :images, :as => :imagable, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
end
