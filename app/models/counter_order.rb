# == Schema Information
#
# Table name: counter_orders
#
#  id         :integer          not null, primary key
#  counter_id :integer
#  item_id    :integer
#  quantity   :integer
#  status     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CounterOrder < ActiveRecord::Base
  #attr_accessible :quantity
  validates :quantity, :presence=>true
 after_initialize :init
 belongs_to :item
  def init
    self.status||=0
  end
  def itemname
    Item.find(self.item_id).item_name
  end
end
