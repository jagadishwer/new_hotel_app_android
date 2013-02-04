# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  item_name   :string(255)
#  price       :float
#  description :text
#  category_id :integer
#  counter_id  :integer
#  kitchen_id  :integer
#

class Item < ActiveRecord::Base

   resourcify
  attr_accessible :item_name, :price, :category_id,:counter_id, :description, :attachments_attributes,:kitchen_id,:recipes_attributes
  validates :item_name, :presence => true, :uniqueness => true

  #has_many :customers, :through=>:orders, :dependent=>:destroy
  has_many :orders, :through=>:orderlists
  belongs_to :category
  has_many :orderlists
  has_many :counter_orders
  has_many :stock_list_items, :through=>:recipes
  has_many :recipes, :dependent => :destroy
  accepts_nested_attributes_for :recipes, :allow_destroy => true
  has_many :attachments, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  belongs_to :counter
  belongs_to :kitchen
end
