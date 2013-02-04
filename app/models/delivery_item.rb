# == Schema Information
#
# Table name: delivery_items
#
#  id                 :integer          not null, primary key
#  stock_list_item_id :integer
#  delivery_id        :integer
#  mrp                :float
#  quantity           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  supplier_id        :integer
#  payment_status     :integer
#  user_id            :integer
#

class DeliveryItem < ActiveRecord::Base
  # attr_accessible :title, :body
  resourcify
  attr_accessible :stock_list_item,:stock_list_item_id, :mrp, :quantity,:supplier_id,:payment_status, :user_id
  #attr_accessor :item_name
  belongs_to :delivery
  belongs_to :stock_list_item
  belongs_to :supplier
  belongs_to :users
  validates :stock_list_item_id, :presence => true
  validates :mrp, :presence => true
  validates :quantity, :presence => true
  after_initialize :init
  def item_name=(x)
    @s= StockListItem.create(:name=>x)
    @s.delivery_item<<self
  end
  def item_name
    StockListItem.find(self.stock_list_item_id).name
  end
  def init
    #self.count ||= 15
    #self.user_id ||= current_user.id
    self.payment_status ||= 0
  end
end
