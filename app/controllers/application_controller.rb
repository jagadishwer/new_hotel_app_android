class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user_time_zone



rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  destroy_user_session_path
  redirect_to root_url
end

  def kitchen_authorize
    raise CanCan::AccessDenied unless current_user.has_role? :kitchen or current_user.has_role?:manager
  end
  def counter_authorize
     raise CanCan::AccessDenied unless current_user.has_role? :till_operator or current_user.has_role?:manager
  end
def verify
 
  if current_user.has_role? :kitchen
    redirect_to kitchen_url
    elsif current_user.has_role? :till_operator
      redirect_to :controller=>'counters', :action=>'other_counter'
  end
end

private

def set_user_time_zone
  Time.zone = current_user.time_zone if !current_user.nil?
end
end
