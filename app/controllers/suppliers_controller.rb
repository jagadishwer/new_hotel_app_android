class SuppliersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  def new
    @supplier=Supplier.new

  end
  def create
    if Supplier.create(params[:supplier])
    redirect_to :action=>'show'
    else 
      render :text=> "unable to add supplier"
    end
  end

  def show
@supplier=Supplier.all

  end

  def edit
      @supplier=Supplier.find(params[:id])
  end
  def update
    @supplier=Supplier.find(params[:supplier][:id])
    if @supplier.update_attributes(params[:supplier])

   redirect_to :action=>'show'
    else
      render :text=> "unable to add supplier"
    end
  end
 def payment
  @supplier=Supplier.find(params[:id])
  @delivery=DeliveryItem.find(:all, :conditions=>{:supplier_id=>@supplier.id,:payment_status=>0})
  @delivery.each do |x|
    x.update_attributes(:payment_status=>1);
  end
   render :text=> DeliveryItem.sum(:mrp, :conditions=>{:supplier_id=>@supplier.id,:payment_status=>0})
 end
 def supply_list
    @supplier=Supplier.find(params[:id])
    @delivery=DeliveryItem.find(:all, :conditions=>{:supplier_id=>@supplier.id,:payment_status=>0})
 end
end
