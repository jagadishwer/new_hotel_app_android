class CounterOrdersController < ApplicationController
  def new

 @counter= Counter.find_by_name('Bakery')
 @items=@counter.items
 render :layout=>false
  end
  def create


    @counter= Counter.find_by_name('Bakery')
 @items=@counter.items
    @count=0
    @items.each do |s|
      io=CounterOrder.new(:item_id=>s.id,:quantity=>params[s.item_name][:quantity],:user_id=>current_user.id,:counter_id=>@counter.id)
     if io.save
      @count+=1

     end


    end

 flash[:notice]="Order for #{@count} item placed"
# render 'new'
       redirect_to :action=>'bakery' , :controller=>'counters'

  end

 def update
   @counter_order =  CounterOrder.find(params[:id])

   @counter_order.update_attributes(:status=>1)


end
def update_all
  @counter_orders =  CounterOrder.where(:counter_id=>params[:counter],:status=>0)
  @counter_orders.each do|i|
    i.update_attributes(:status=>1)
  end

end


end
