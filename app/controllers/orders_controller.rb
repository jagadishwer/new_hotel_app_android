class OrdersController < ApplicationController
#load_and_authorize_resource
before_filter :authenticate_user!
  def cancel_order
    @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
    @order_lists.each do |i|
      i.destroy
    end
    redirect_to :controller => "counters", :action => "final_order"
  end
 def create
    #@card=SwipeCard.find_by_card_no(params[:card_no])
    
    @card=SwipeCard.find(session[:card])
    unless @card.nil?
      if (@card.balance.to_f >= params[:total].to_f)
      @card.balance=@card.balance.to_f-params[:total].to_f
      @card.save
   
   @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
   @order= Order.new(:status=>0,:counter_id=>session[:counter],:total=>params[:total])
   @sum=0
   @order_lists.each do |ol|
     @order.orderlists<<ol
     
   end
   
   if @order.save
     c=Customer.create(:counter_id=>session[:counter],:total=>params[:total],:status=>2)
     c.orders<<@order
     Transaction.create(:counter_id=>session[:counter],:cost=>params[:total],:swipe_card_id=>@card.id,:type_of_transaction=>2,:balance=>@card.balance)
session[:card]=nil
         render :text=>"Transaction Was Successful"
   end
      else
        render :text=>" In Suficient Balance"

      end
    else
      render :text =>"Card Not Found"
    end
    #session[:counter]=nil
  
 #redirect_to :controller => "counters", :action => "final_order"

 end
  
end
