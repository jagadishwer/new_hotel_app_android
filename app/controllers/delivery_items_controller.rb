class DeliveryItemsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def new
    #@delivery=DeliveryItem.new()
    @stlis= StockListItem.find(:all)
    @stock_list_item= StockListItem.new()
    @suppliers=Supplier.all
  end
  def create
    @delivery = Delivery.new
    @stlis = StockListItem.all
    @sum=0
    @count=0
    @stlis.each do |s|
      dl=DeliveryItem.new(:stock_list_item_id=>s.id,:mrp=> params[s.name][:mrp],:quantity=>params[s.name][:quantity],:supplier_id=>params[s.name][:supplier_id],:user_id=>current_user.id)
     if dl.save
      @delivery.delivery_items<<dl
      @count += 1
      @sum+=params[s.name][:mrp].to_f
     end
    end
    if @count > 0
      @delivery.cost = @sum
      @delivery.save
     redirect_to :controller=>'hotelsessions', :action=>'check_inventory'
    else
      flash[:error] = "Failed! Delivery Items list should not be empty."
      redirect_to :controller=>'delivery_items', :action => 'new'
    end

  end
end
