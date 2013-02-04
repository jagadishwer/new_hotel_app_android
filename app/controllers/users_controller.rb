class UsersController < Devise::SessionsController
#class SessionsController < Devise::SessionsController
#prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
#load_and_authorize_resource
layout 'others'
#before_filter :authenticate_user!


end