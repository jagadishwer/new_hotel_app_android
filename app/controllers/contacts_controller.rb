class ContactsController < ApplicationController
  before_filter :authenticate_user!, :except=>['show']
  load_and_authorize_resource :except=>['show']
  
  def new
    @contactus = Contact.new
  end
  def create
    @contactus = Contact.new(params[:contact])
    @contactus.save
    redirect_to :action => 'show'
  end
  def show
    @contactus = Contact.all
    @h = {}
    @contactus.each do |x|
      @h[:title]= x.title
      @h[:email] = x.email
      @h[:address] = x.address
      @h[:phone_no] = x.phone_no
      @h[:fax_no] = x.fax_no
      @h[:latitude] = x.latitude
      @h[:longitude] = x.longitude

    end
    @h = {:contact_us => @h}
    respond_to do |format|
      format.html {}
      format.json { render :json => @h }
      format.xml { render :xml => @h}
    end
  end
  def edit
    @contactus = Contact.find(params[:id])
  end
  def update
    @contactus = Contact.find(params[:contact][:id])
    @contactus.update_attributes(params[:contact])
    redirect_to :action => 'show'
  end
  def destroy
    @contactus = Contact.find(params[:id])
    @contactus.destroy
    redirect_to :action => 'show'
  end
end
