class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except=>['show']
  load_and_authorize_resource :except=>['show']
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        format.html {redirect_to  :action=>'show'}
        format.json{}
        format.xml{}
      else
        format.html {render 'new'}
      end
    end
    
  end

  def show
    @categories=Category.all

    @w=[]
    @categories.each do |x|
       @h={}
        @h[:name]=x.name
        @h[:id]=x.id
        @w<<@h
    end
    @z={:categories=>@w}
    respond_to do |format|
     format.html {}
        format.json{render :json=>@z}
        format.xml{render :xml=>@z}
    end
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:category][:id])
    @category.update_attributes(params[:category])
    redirect_to :action=>'show'
  end
end
