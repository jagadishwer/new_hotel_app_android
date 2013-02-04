class ReportsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class=>false
  def payments_due
    @suppliers=Supplier.all

  end
  def internal_orders
    @internal_orders =  InternalOrder.find(:all,:conditions=>{:status=>0})
    render :layout=>false
  end
  def updateorder
    @internal_orders =  InternalOrder.find(params[:id])
 
    @internal_orders.update_attributes(:status=>1)
  
    redirect_to :action=>'internal_orders'
  end
  def update_all_order
    @internal_orders =  InternalOrder.all
    @internal_orders.each do|i|
      i.update_attributes(:status=>1)
    end
    render :text=> "Sucessfully Delivered"
  end
  def analysis

  end
  def analysis_last
    @sc=StockCount.find(:last)
    @previous_stock_count=StockCount.find(:last,:conditions=>['created_at <?',@sc.created_at])
       analysis_from_start if @previous_stock_count.nil?
    unless @sc.nil?
      @remaining_items=@sc.remaining_items
    end
    render :layout=>false
  end
  def analysis_from_start
@sc=StockCount.find(:last)

unless @sc.nil?
      @remaining_items=@sc.remaining_items
    end
    render :layout=>false
  end


  def send_day_report
    @customers=Customer.find(:all,:order=>'updated_at DESC',:conditions=>{:status=>2,:date_of_transcation=>Date.today})
    @items=Item.all
    attachment = render_to_string(:action => 'send_day_report',:layout => false)
    ReceiptMailer.mail_day_report(attachment).deliver
    flash[:notice]="Successfully Sent"
    render '/hotelsessions/day_report'
  end
end
