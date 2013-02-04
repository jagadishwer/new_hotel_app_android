# == Schema Information
#
# Table name: counters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Counter < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  validates :name, :uniqueness => true
  resourcify
  has_many :items
  has_many :orders
  has_many :customers
  #has_many :internal_orders
  has_many :kitchens
end
