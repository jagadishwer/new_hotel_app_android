class TaxesController < ApplicationController
before_filter :authenticate_user!,:except=>['show']
  load_and_authorize_resource :except=>['show']
  def new
    @tax=Tax.new
  end

  def create
    if Tax.create(params[:tax])
      redirect_to :action=>'show'
    else
      redirect_to :action=>'new'
    end
  end

  def edit
    @tax = Tax.find(params[:id])
  end

  def update
    @tax = Tax.find(params[:tax][:id])
    @tax.update_attributes(params[:tax])
    redirect_to :action=>'show'
  end
  
  def show
    @taxes=Tax.all
    @total=Tax.sum(:percentage)
    @tax=[]
    @taxes.each do |t|
      @h={}
      @h[:name]=t.name
      @h[:percentage]=t.percentage
      @tax<<@h
    end
    @tax={:tax=>@tax,:total_tax=>@total.to_s}
    respond_to do |format|
      format.html
      format.json{render :json=>@tax}
      format.xml{render :xml=>@tax}
    end
  end

  def destroy
    @tax = Tax.find(params[:id])
    @tax.destroy
    redirect_to :action=>'show'
  end

end
