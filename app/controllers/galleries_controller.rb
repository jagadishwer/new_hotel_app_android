class GalleriesController < ApplicationController
  #load_and_authorize_resource
  before_filter :authenticate_user!, :except=>['show']
  def new
    @gallery = Gallery.new
  end
  def create
    @gallery = Gallery.new(params[:gallery])
    @gallery.save
    redirect_to :action => 'show'
  end
  def show
    @gallery = Gallery.all
    @gallery_images = []
    @hash = {}
    @gallery.each do |i|
      i.images.each do |x|
        @h = {}
        @h[:url] = x.photo_url
        @gallery_images << @h
      end
    @hash[:gallery_images] = @gallery_images
    end
    
    respond_to do |format|
      format.html {}
      format.json { render :json => @hash }
      format.xml { render :xml => @hash }
    end
  end
  def edit
    @gallery = Gallery.find(params[:id])
  end
  def update
    @gallery = Gallery.find(params[:gallery][:id])
    @gallery.update_attributes(params[:gallery])
    redirect_to :action=>'show'
  end
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to :action => 'show'
  end
end
