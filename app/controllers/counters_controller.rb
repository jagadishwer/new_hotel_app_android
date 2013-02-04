class CountersController < ApplicationController
  before_filter :authenticate_user!
  layout 'show' ,:except=>["counters","reciept"]
  
  authorize_resource
  before_filter :counter_authorize
  def new
    @counter= Counter.new
  end

  def create
    @counter= Counter.new(params[:counter])
    if @counter.save
      redirect_to :action=>'show'
    else
       redirect_to :action=>'show'
    end
  end

  def edit
    @counter=Counter.find(params[:id])
  end

  def show
    @counters=Counter.find(:all, :conditions=>"name!='main_counter'")
  end
  def update
    @counter = Counter.find(params[:counter][:id])
    @counter.update_attributes(params[:counter])
    redirect_to :action=>'show'
  end
  def main_counter

  end
  def other_counter
#    session[:counter]=nil
#    @counters=Counter.all
    #@counters.reject!{|x| ['main_counter','Cocktails'].include?x.name}
    

  end

  
  def counter_items
    if session[:counter].nil?
    @counter = Counter.find_by_id(params[:counter][:counter_id])
    session[:counter]=params[:counter][:counter_id]
    else
      @counter=Counter.find_by_id(session[:counter])
    end
    if @counter.nil?
      flash[:error] = "Please select atleast one counter!"
      redirect_to :controller => 'counters', :action => 'other_counter'
    else
      @items = @counter.items
      render 'order_counter'
    end
  end



  def indian


    @counter= Counter.find_by_name('Indian')
    unless @counter.nil?
      session[:counter]=@counter.id
      @items = @counter.items
      render 'order_counter'
    else
      flash[:error]="Opps! Page Not Found"
      redirect_to root_url

    end

 end

 

  def cocktail
    @counter= Counter.find_by_name('Cocktails')
    unless @counter.nil?
      session[:counter]=@counter.id
      @items = @counter.items
      render 'order_counter'
    else
      flash[:error]="Opps! Page Not Found"
      redirect_to root_url

    end

  end

#def bakery_orders
#   @counter= Counter.find_by_name('Bakery')
#   @bakery_items=@counter.items
#end

  def bakery

     @counter= Counter.find_by_name('Bakery')
     #render :text=>@counter.id
    unless @counter.nil?
      session[:counter]=@counter.id
      @items = @counter.items
      render 'bakery'
    else
      flash[:error]="Opps! Page Not Found"
      redirect_to root_url

    end
  end
  def remaining_bakery_items
    @kitchen= Kitchen.find_by_name('Bakery')
    unless @kitchen.nil?
      @items= @kitchen.items
    end
    render :layout=>false
  end








  def final_order
    #render :text=>"ok"
     @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
     @total_tax=Tax.sum(:percentage)/100
     @tax=Tax.all
     render :layout => false
  end
#  def confirm_order
#    @card=SwipeCard.new()
#    @total=params[:total]
#
#  end
  
  def counters

  end
  def check_order_status
    @customers = Customer.search(params[:search])
    render :layout=>false
  end
  def reciept
   @orderlist=Orderlist.find(:last, :conditions=>{:user_id=>current_user.id})
   unless @orderlist.nil?
    
   @order = @orderlist.order
   unless @order.nil?
   @customer=@order.customer
   end
   end
   @tax=Tax.all
render :layout=> 'print_layout'
  end

end
