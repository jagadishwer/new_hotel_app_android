# == Schema Information
#
# Table name: remaining_items
#
#  id                 :integer          not null, primary key
#  stock_list_item_id :integer
#  stock_count_id     :integer
#  quantity           :integer
#  mrp                :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#

class RemainingItem < ActiveRecord::Base
  resourcify
  attr_accessible :stock_list_item_id, :mrp, :quantity, :user_id
  belongs_to :stock_count
  belongs_to :stock_list_item
  belongs_to :users
  def name
    self.stock_list_item.name
  end
  #after_initialize :init
  #def init
    #self.count ||= 15
    #self.user_id ||= current_user.id
    #self.cancel_item ||= false
  #end
end
