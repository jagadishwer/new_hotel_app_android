class PaidOutsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  def new
    @paid_out=PaidOut.new
  end
 def create
   if PaidOut.create(params[:paid_out],:user_id=>current_user.id)
     redirect_to :action=>'show',:controller=>'paid_outs'

   end
 end
  def show
        @paid_outs=PaidOut.all
  end
end
