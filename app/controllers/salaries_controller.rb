class SalariesController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  #layout 'others'
  def new
    @employees=Employee.all
    @salary=Salary.new
  end
def create

 @salary=Salary.new(params[:salary])
 if @salary.save
flash[:notice]="Sucessfully added"
 else
   flash[:error]="UnSucessfully operation"
 end

redirect_to :action=>'index'
end

  def edit

   @employees=Employee.all
@salary=Salary.find(params[:id])

  end
  def update
    @salary=Salary.find(params[:salary][:id])
    if @salary.update_attributes(params[:salary])
    flash[:notice]="Sucessfully Updated"
 else
   flash[:error]="UnSucessfully operation"
    end
    redirect_to :action=>'index'
  end

  def index
    @salaries=Salary.find(:all,:conditions=>{:target_year=>Time.now.year,:target_month=>Time.now.month})
  end

  def show
    @salary=Salary.find(params[:id])
  end

  def get_attendance
    @a=Attendance.sum(:total,:conditions=>{:employee_id=>params[:employee_id].to_i,:target_year=>params[:target_year].to_i,:target_month=>params[:target_month].to_i})
    puts "========================================"
    puts @a
    render :text=>@a
  end
  def pay_slips
    @salaries=Salary.find(:all,:conditions=>{:target_year=>Time.now.year,:target_month=>Time.now.month})
    render :layout=>'others'
  end
end
