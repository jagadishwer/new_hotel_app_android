class ManageUsersController < ApplicationController
#before_filter :authenticate_user!
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to :controller => 'manage_users', :action => 'index'
    else
      
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    @user = User.find(params[:user][:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to :controller => 'manage_users', :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to :controller => 'manage_users', :action => 'index'
    end
  end
end
