class AboutsController < ApplicationController
  before_filter :authenticate_user!, :except=>['show']
  load_and_authorize_resource :except=>['show']
  def new
    @aboutus = About.new
  end
  def create
    @aboutus = About.new(params[:about])
    @aboutus.save
    redirect_to :action => 'show'
  end
  def show
    @aboutus = About.all
    @h = {}
    @aboutus.each do |x|
      @h[:title] = x.title
      @h[:description] = x.description
    end
    @h = {:about_us => @h}
    respond_to do |format|
      format.html {}
      format.json { render :json => @h}
      format.xml { render :xml => @h}
    end
  end
  def edit
    @aboutus = About.find(params[:id])
  end
  def update
    @aboutus = About.find(params[:about][:id])
    @aboutus.update_attributes(params[:about])
    redirect_to :action => 'show'
  end
  def destroy
    @aboutus = About.find(params[:id])
    @aboutus.destroy
    redirect_to :action => 'show'
  end
end
