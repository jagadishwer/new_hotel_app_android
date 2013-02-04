class OrderlistsController < ApplicationController
  before_filter :authenticate_user!, :except=>['cancelrequest']
  authorize_resource :except=>['cancelrequest']
  def new
   
    @orderlist=Orderlist.new()
    @id=params[:id]
    @price=params[:price]
  end
  # def create
  ## @order=Orderlist.new(:counter_id=>session[:counter],:item_id=>params[:orderlist][:id],:quantity=>params[:orderlist][:quantity],:price=>params[:orderlist][:price])
  # @order=Orderlist.find_by_item_id(params[:id],:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
  #   if @order.nil?
  #   @order=Orderlist.create(:counter_id=>session[:counter],:kitchen_id=>params[:kitchen_id],:item_id=>params[:id],:quantity=>params[:quantity],:price=>params[:price],:user_id=>current_user.id)
  #   else
  #     @order.update_attributes(:quantity=>@order.quantity+params[:quantity].to_i)
  #   end
  #   bakery_order if Counter.find(session[:counter]).name=='Bakery'
  #   redirect_to :controller=>'counters', :action=>'final_order'
  #  # if @order.save
  #
  #   #redirect_to :action=>:counter_items,:controller=>:counters
  # #else
  # #end
  # end
  def create

    if Counter.find(session[:counter]).name=="Bakery" and Kitchen.find(params[:kitchen_id]).name == "Bakery"
      
      bakery_order

    else
      indian_order
    end
    
  end

  def update
if Counter.find(session[:counter]).name=="Bakery" and Kitchen.find(params[:kitchen_id]).name == "Bakery"


    update_bakery_items 
else
  
    @ol=Orderlist.find(params[:id])
    if params[:quantity].to_i > 0
      @ol.update_attributes(:quantity => params[:quantity])
    else
      flash[:error] = 'Invalid Quantity!'
    end
    redirect_to :controller=>'counters', :action=>'final_order'
end
  end





  # load_and_authorize_resource
  def cancelrequest

   
    c=Customer.find_by_table_id(params[:table_id],:conditions=>{:status=>0})
    puts c.inspect
    c.orders.where(:status=>0).each do |o|
      i= o.orderlists.find(:first,:conditions=>{:item_id=>params[:item_id],:quantity=>params[:quantity]})
      if !i.nil?
        i.update_attributes(:cancel_item=>true)
        puts i
        break
      end
    end
    respond_to do|format|

      format.html
      format.json {render :json=> true}
      format.xml{render :xml=>true}
       
          
    end
  end

  def destroy

    ol=Orderlist.find(params[:id])
    ord=Order.find(ol.order_id)
    ord.total-=ol.price+(ol.price*Tax.sum(:percentage))/100
    ord.save
    ol.destroy
    #redirect_to :controrller=>:hotelsessions, :action=>:show
    redirect_to :controrller=>:kitchens, :action=>:show
  end
  def cancel
    ol=Orderlist.find(params[:id])
    ol.destroy

    redirect_to :controller=>'counters', :action=>'final_order'
  end
  private
  def bakery_order
    if (CounterOrder.sum(:quantity,:conditions=>{:item_id=>params[:id]})- Orderlist.sum(:quantity,:conditions=>{:item_id=>params[:id]}))>= params[:quantity].to_i
    @order=Orderlist.find_by_item_id(params[:id],:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
    if @order.nil?
      @order=Orderlist.create(:status=>1,:counter_id=>session[:counter],:kitchen_id=>params[:kitchen_id],:item_id=>params[:id],:quantity=>params[:quantity],:price=>params[:price],:user_id=>current_user.id)
    else
      @order.update_attributes(:status=>1,:quantity=>@order.quantity+params[:quantity].to_i)
    end
    redirect_to :controller=>'counters', :action=>'final_order'
    else
     render :text=>"Insufficient Quantity", :layout=>false
    end
  end
  def indian_order
    
    @order=Orderlist.find_by_item_id(params[:id],:conditions=>{:counter_id=>session[:counter],:order_id=>nil})

    if @order.nil?
      @order=Orderlist.create(:counter_id=>session[:counter],:kitchen_id=>params[:kitchen_id],:item_id=>params[:id],:quantity=>params[:quantity],:price=>params[:price],:user_id=>current_user.id)
    else
      @order.update_attributes(:quantity=>@order.quantity+params[:quantity].to_i)
    end
    
   redirect_to :controller=>'counters', :action=>'final_order'
  end

  def update_bakery_items
   
    
    if (CounterOrder.sum(:quantity,:conditions=>{:item_id=>params[:item_id].to_i,:status=>1})+Orderlist.sum(:quantity,:conditions=>{:item_id=>params[:item_id].to_i,:order_id=>nil})-Orderlist.sum(:quantity,:conditions=>{:item_id=>params[:item_id].to_i}))>= params[:quantity].to_i

      @ol=Orderlist.find(params[:id])
      if params[:quantity].to_i > 0
      @ol.update_attributes(:quantity => params[:quantity])
       
      end
     
    
    end
    redirect_to :controller=>'counters', :action=>'final_order'
  end
end
