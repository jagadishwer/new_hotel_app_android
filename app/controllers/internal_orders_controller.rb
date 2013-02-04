class InternalOrdersController < ApplicationController
#layout 'others'
  def new
    @stlis= StockListItem.all
    @internal_order = InternalOrder.new
  end
def create


    @stock_list_items = StockListItem.all
    @count=0
    @stock_list_items.each do |s|
      io=InternalOrder.new(:stock_list_item_id=>s.id,:quantity=>params[s.name][:quantity],:user_id=>current_user.id,:kitchen_id=>session[:kitchen])
     if io.save
      @count+=1

     end

      
    end

 flash[:notice]="Order for #{@count} item placed"
       redirect_to :action=>'show' , :controller=>'kitchens'
    
  end




  def show

   @internal_order = InternalOrder.find_by_counter_id(params[:counter_id])

  end
end
