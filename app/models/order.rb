# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  total       :float
#  status      :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  counter_id  :integer
#

class Order < ActiveRecord::Base

 resourcify
  # attr_accessible :title, :body
 # has_many :items, :dependent=>:destroy
#has_and_belongs_to_many :user
belongs_to :customer
belongs_to :counter
#belongs_to :item
has_many :items, :through=>:orderlists, :dependent=>:destroy
has_many :orderlists
 after_initialize :init
  def init
    #self.count ||= 15
    self.status ||= 0
  end


   
end
