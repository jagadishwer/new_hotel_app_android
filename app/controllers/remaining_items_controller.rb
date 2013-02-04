class RemainingItemsController < ApplicationController
before_filter :authenticate_user!
  load_and_authorize_resource
  def new
    #@delivery=DeliveryItem.new()
    @stlis= StockListItem.find(:all)
    @stock_list_item= StockListItem.new()
  end
  def create
    @stock_count = StockCount.new
    @stock_list_items = StockListItem.all
    @sum=0
    @stock_list_items.each do |s|
      ri=RemainingItem.create(:stock_list_item_id=>s.id,:mrp=> params[s.name][:mrp],:quantity=>params[s.name][:quantity],:user_id=>current_user.id)
     @stock_count.remaining_items<<ri
      
    @sum+=params[s.name][:mrp].to_f
    end
    @stock_count.cost=@sum
    @stock_count.save
    render :text=>"Stock Count Successfully Saved", :layout=>true
  end
end
