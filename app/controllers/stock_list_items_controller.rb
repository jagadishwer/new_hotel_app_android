class StockListItemsController < ApplicationController
  #/stock_list_items/create.json,{:name=>"<item_name>"}
  before_filter :authenticate_user!, :except=>['create','show']
  authorize_resource :except=>['create','show']
  def new
    @stock_list_item = StockListItem.new
  end
  def create
    @stli= StockListItem.new(:name=>params[:stock_list_item][:name])
    respond_to do|format|
      if @stli.save
        format.html { redirect_to :controller => 'stock_list_items', :action => 'show'}
        format.json {render :json=>true}
        format.xml {render :xml=>true}
      else
        format.html { redirect_to :controller => 'stock_list_items', :action => 'new'}
        format.json {render :json=>false}
        format.xml {render :xml=>false}
      end
    end
  end
  #/stock_list_items/show.json
  def show
    @stli = StockListItem.all
    @suppliers= Supplier.all
    @stli2={:itemlist=>@stli,:suppliers=>@suppliers}
    respond_to do|format|
      format.html
      format.json {render :json=>@stli2}
      format.xml {render :xml=>@stli2}
    end
  end
  def edit
    @stock_list_item = StockListItem.find(params[:id])
  end
  def update
    @stock_list_item = StockListItem.find(params[:stock_list_item][:id])
    @stock_list_item.update_attributes(params[:stock_list_item])
    redirect_to :controller => 'stock_list_items', :action => 'show'
  end
end
