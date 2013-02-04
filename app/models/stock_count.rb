# == Schema Information
#
# Table name: stock_counts
#
#  id         :integer          not null, primary key
#  cost       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StockCount < ActiveRecord::Base
  # attr_accessible :title, :body
   resourcify
   has_many :stock_list_items, :through=>:remaining_items
   has_many :remaining_items
end
