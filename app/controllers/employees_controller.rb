class EmployeesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        employees = Employee.all
        render json: employees
    end

    def show
        employee = Employee.find(params[:id])
        render json: employee
    end

    def login
        employee = Employee.find_by(username: params[:username])
        if employee && employee.authenticate(params[:password])
            render json: employee
        else 
            render json: {errors: 'Sorry, invalid name or password'}
        end 
    end
end
