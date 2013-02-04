class DeliveriesController < ApplicationController
  #/deliveries/create.json,{:stock_list_item_id=>"1,2",:mrp=>"12.2,13.5",:quantity=>"3,4",:supplier=>"1,2"}
  before_filter :authenticate_user!, :except=>['create']
  load_and_authorize_resource :except=>['create']
  def new
    #@delivery=DeliveryItem.new()
    @stlis= StockListItem.find(:all)
      @stock_list_items= StockListItem.new()
  end
  def create
    @stock_list_item_ids=params[:stock_list_item_id].split(",")
    @mrps=params[:mrp].split(",")
    @quantities=params[:quantity].split(",")
    @suppliers=params[:supplier].split(",")

    @no_of_items=(0..@stock_list_item_ids.size-1)

#    puts "======2====="
   @delivery=Delivery.new()
#    puts"=====3===="
#
#
#
#    puts @no_of_items
    @total=0
    @no_of_items.each do|i|
      @total+=@mrps[i].to_f*@quantities[i].to_i

      @delivery.delivery_items << DeliveryItem.create(:supplier_id=>@suppliers[i].to_i,:stock_list_item_id=>@stock_list_item_ids[i].to_i,:mrp=>@mrps[i].to_f,:quantity=>@quantities[i].to_i)
    end
   @delivery.cost=@total

    respond_to do|format|
      if @delivery.save
        @h={:delivery=>@delivery}
        format.html
        format.json{render :json=>@h }
        format.xml{render :xml=>@h}
      else
        format.html
        format.json{render :json=>nil }
        format.xml{render :xml=>nil}
      end
    end

  end
end
