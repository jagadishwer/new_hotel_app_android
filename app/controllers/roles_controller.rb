class RolesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @role = Role.new
  end
  def create
    @role = Role.new(params[:role])
    @role.save
  end
  def show
    @roles = Role.all
  end
  def edit
    @role = Role.find(params[:id])
  end
  def update
    @role = Role.find(params[:role][:id])
    @role.update_attribues(params[:role])
    
  end
  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to :controller => 'roles', :action => 'show'
  end
end
