# == Schema Information
#
# Table name: kitchens
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  counter_id  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Kitchen < ActiveRecord::Base
  attr_accessible :counter_id, :description, :name
  validates :name, :presence => true, :uniqueness => true
  belongs_to :counter
  has_many :items
  has_many :internal_orders
end
