class AttendancesController < ApplicationController

  before_filter :authenticate_user!
  authorize_resource
  def new
    @employees=Employee.all
    @attendance=Attendance.new
  end
def create
  
 if Attendance.create(params[:attendance])
flash[:notice]="Sucessfully added"
 else
   flash[:error]="UnSucessfully operation"
 end

redirect_to :action=>'index'
end

  def edit

   @employees=Employee.all  
@attendance=Attendance.find(params[:id])
  end
  def update
    @attendance=Attendance.find(params[:attendance][:id])
    if @attendance.update_attributes(params[:attendance])
    flash[:notice]="Sucessfully Updated"
 else
   flash[:error]="UnSucessfully operation"
    end
    redirect_to :action=>'index'
  end

  def index
    @attendances=Attendance.find(:all,:conditions=>{:target_year=>Time.now.year,:target_month=>Time.now.month})
  end

  def show
  end
end
