# == Schema Information
#
# Table name: deliveries
#
#  id         :integer          not null, primary key
#  cost       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Delivery < ActiveRecord::Base
  # attr_accessible :title, :body
   resourcify
  has_many :stock_list_items, :through=>:delivery_items
  has_many :delivery_items
  

#has_many :suppliers, :through=> :
end
