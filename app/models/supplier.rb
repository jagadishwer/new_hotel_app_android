# == Schema Information
#
# Table name: suppliers
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :string(255)
#  contact_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Supplier < ActiveRecord::Base
   resourcify
  # attr_accessible :title, :body
  #has_many :deliveries, :through=>:delivery_items
  has_many :delivery_items
end
