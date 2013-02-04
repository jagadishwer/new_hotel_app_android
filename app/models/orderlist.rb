# == Schema Information
#
# Table name: orderlists
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  item_id     :integer
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cancel_item :boolean
#  counter_id  :integer
#  user_id     :integer
#  kitchen_id  :integer
#  status      :integer
#

class Orderlist < ActiveRecord::Base
  # attr_accessible :title, :body
  resourcify
  validates :quantity, :numericality => {:only_integer => true, :greater_than => 0}
  belongs_to :order
  belongs_to :item
  belongs_to :user
 after_initialize :init
 def init
  #self.count ||= 15
#    self.user_id ||= current_user.id
 self.cancel_item ||= false
 self.status ||= 0
 end
def itemname
  Item.find(self.item_id).item_name
end
def status_info
  case self.status
  when 0
    "Order under Process"
  when 1
    "Delivered from kitchen"
  end
end
end
