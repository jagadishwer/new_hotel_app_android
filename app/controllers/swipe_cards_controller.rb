class SwipeCardsController < ApplicationController

before_filter :authenticate_user!
helper_method :sort_column, :sort_direction
authorize_resource
#def index
#   @card=SwipeCard.order(params[:sort])
#end
  def new
    @card=SwipeCard.new()
    
  end

  def refund
   @card=SwipeCard.find(session[:card])
   @prev_balance=@card.balance.to_f
   if @card.update_attributes(:balance=>0)
     Transaction.create(:counter_id=>@counter,:cost=>@prev_balance,:swipe_card_id=>@card.id,:type_of_transaction=>3,:balance=>@card.balance,:user_id=>current_user.id)
     
      render 'card_details', :layout=>false
   end
        
    #@transactions=Transaction.all
    
  end
  def create
    @card=SwipeCard.new(params[:swipe_card])
    
    @card.user_id=current_user.id
    if @card.save
      @counter=Counter.find_by_name('main_counter')

      Transaction.create(:counter_id=>@counter,:cost=>params[:swipe_card][:balance].to_f,:swipe_card_id=>@card.id,:type_of_transaction=>1,:balance=>@card.balance,:user_id=>current_user.id)
      flash[:notice] = "Swipe card created successfully!"
      redirect_to :action=>'main_counter', :controller=>'counters'
    else
      render 'new'
    end

  end
  def show
#@cards = SwipeCard.all
raise CanCan::AccessDenied unless current_user.has_role? :admin or current_user.has_role?:manager or current_user.has_role?:moderator

@cards=SwipeCard.search(params[:search]).order(sort_column + " " + sort_direction)

  end
  def recharge
    if request.post?
      @card=SwipeCard.find(session[:card])
      @amount=@card.balance+params[:swipe_card][:balance].to_f
      @counter=Counter.find_by_name('main_counter')
      #render :text=>@amount
      if @card.update_attributes(:balance=>@amount)
        Transaction.create(:counter_id=>@counter,:cost=>params[:swipe_card][:balance].to_f,:swipe_card_id=>@card.id,:type_of_transaction=>1,:balance=>@card.balance,:user_id=>current_user.id)
        redirect_to :action=>'main_counter', :controller=>'counters'
       
      end
    else
      if !session[:card].nil?
      @card=SwipeCard.new()
      else
        render :text=>"Swipe Your Card First"
      end
      #authorize! unless can? :read, @card
    end
  end


  
  def update

  
    @t=Transaction.find(params[:id])

    @c=SwipeCard.find(@t.swipe_card_id)
    @c.balance=@c.balance.to_f+@t.cost.to_f
    @counter=Counter.find_by_name('main_counter')
    if @c.save
      @t.type_of_transaction=1
      @t.save
      Transaction.create(:counter_id=>@counter,:cost=>@t.cost,:swipe_card_id=>@c.id,:type_of_transaction=>1,:balance=>@c.balance,:user_id=>current_user.id)
      redirect_to :action=>'main_counter', :controller=>"counters"
    end
  end
  def card_session
    
     @card=SwipeCard.find_by_card_no(params[:id])
    session['card']=@card.id
     puts "**********************************************"
    puts session['card']
    return

  end
  def card_details
 #@card=SwipeCard.find_by_card_no(params[:id])
 if session['card'].nil?
    @card=SwipeCard.find_by_card_no(params[:card_no])
    session['card']=@card.id
 else
   @card=SwipeCard.find(session['card'])
 end
  # authorize!(:read,@card)
  #authorize! if can? :read, @card
     render 'card_details', :layout=>false
  end

  def verify
    @card=SwipeCard.find_by_card_no(params[:card][:card_no])
    unless @card.nil?
      if (@card.balance.to_f >= params[:card][:total].to_f)
      @card.balance=@card.balance.to_f-params[:card][:total].to_f
      @card.save
      redirect_to :controller=>'orders',:action=>'create',:id=>@card.id
      else
       render :text=>"no enough balance"

      end
    else
      render :text=>"card not found"
    end

  end
  def cancel
    session['card']=nil
   # @card=session['card']
    render :text=>"Successfully Removed"

    #render 'card_details', :layout=>false
  end
  def swipe_card
    #render :text=>"ok"
    if params.include?("card_no")
       @card= SwipeCard.find_by_card_no(params["card_no"])
       unless @card.nil?
      session[:card]=@card.id
       else
         render :text=>"card not found",:layout=>false
       end
    elsif !session[:card].nil?
      
      @card= SwipeCard.find(session[:card])
    end
    render :layout=>false
  end
def swipe_card_cancel
  session['card']=nil
  render 'swipe_card', :layout=>false
end


 private
 def sort_column
    SwipeCard.column_names.include?(params[:sort]) ? params[:sort] : "card_no"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
 

end
