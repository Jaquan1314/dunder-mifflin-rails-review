class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end

    def show
        @dog = Dog.find(@employee.dog.id)
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            flash[:employee_errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def update
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            flash[:employee_errors] = @employee.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    def edit
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog, :img_url)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
end
