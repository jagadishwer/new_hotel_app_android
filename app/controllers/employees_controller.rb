class EmployeesController < ApplicationController
  def new
    @employee=Employee.new
    @branches = Branch.all
    @positions=Position.all
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
       flash[:notice]="Sucsessfully created"
       redirect_to :action=>'show'
    else
#      flash[:error]="unSucsessfully created"
@branches = Branch.all
    @positions=Position.all
       render 'new', :rel=>"modal"
    end
    
  end

  def edit
    @employee=Employee.find(params[:id])
     @branches = Branch.all
    @positions=Position.all
  end
  def update
    @employee=Employee.find(params[:employee][:id])
    if @employee.update_attributes(params[:employee])
       flash[:notice]="Sucsessfully updated"
    else
      flash[:error]="unSucsessfully operation"
    end
    redirect_to :action=>'show'
  end

  def show
    @employees=Employee.all
  end

end
