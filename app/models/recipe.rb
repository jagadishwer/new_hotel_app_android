class Recipe < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :stock_list_item
  belongs_to :item
end
