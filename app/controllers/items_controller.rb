class ItemsController < ApplicationController
 before_filter :authenticate_user!,:except=>['items_by_catergory','search_by_id']
  authorize_resource :except=>['items_by_catergory','search_by_id']

  def new
   @item = Item.new
   respond_to do |format|
      format.html # new.html.erb
      
   end
 end
 def create
  if request.post?
    @item=Item.new(params[:item])
    @item.counter_id=Kitchen.find(params[:item][:kitchen_id]).counter_id
    respond_to do |format|
      if @item.save
        @i={:id=>@item.id}
        format.html {redirect_to :action=>'show'}
          format.json {render :json=>@i }
          format.xml{render :xml=>@i}
      else
        format.html {redirect_to :action=>'show'}
          format.json {render :json=>nil }
          format.xml{render :xml=>nil}
      end
    end
  end
  end
 def edit
   @item=Item.find(params[:id])
 end
 def show
   @items=Item.all

 end

 def update
  @item=Item.find(params[:item][:id])
  
  @item.update_attributes(params[:item])
  redirect_to :action=>'show'
 end

  def price_change
    @item=Item.find(params[:id])
    
 
     respond_to do |format|
      if @item.update_attributes(:price=>params[:price])
        @i={:id=>@item.id}
        format.html
          format.json {render :json=>true }
          format.xml{render :xml=>true}
      else
        format.html
          format.json {render :json=>nil }
          format.xml{render :xml=>nil}
      end
    end
  end
 
  def display
    @hash = {}
    @categories = Category.all
  
     @categories.each do |y|
        
   @z=[]
        y.items.each do |x|

           @h={}
       @h[:name]=x.item_name
       @h[:id]=x.id
       

       @z<< @h
     end
   @hash[y.name]=@z

   end

    
     respond_to do |format|
       format.json{render :json=>@hash}

       format.xml{render :xml=>@hash}
     end
  end
    def search_by_id
      @item=Item.find(params[:id])
  @h={}
       @h[:name]=@item.item_name
       @h[:id]=@item.id
       @h[:price]=@item.price
       @h[:description]=@item.description
       @h[:kitchen_id]=@item.kitchen_id
       @h[:counter_id]=@item.counter_id
       @image=[]
       @item.attachments.each do|i|
         @w={}
         @w[:url]=i.image.url
         @image<<@w
       end
       @h[:images]=@image
       #@s={:item=>@h}
      respond_to do |format|
        
        format.json{ render :json=>@h}
        format.xml{render :xml=>@h}
      end
    end
    def items_by_catergory
@hash = {}
    @categories = Category.find(params["id"].to_i)

 

   @z=[]
         @categories.items.each do |x|

           @h={}
       @h[:name]=x.item_name
       @h[:id]=x.id


       @z<< @h
     end
   @hash['category_items']=@z

   


     respond_to do |format|
       format.json{render :json=>@hash}

       format.xml{render :xml=>@hash}
     end
  end

end
