class CustomersController < ApplicationController
    def index
        customers = Customer.all
        render json: customers
    end

    def show
        customer = Customer.find(params[:id])
        render json: customer
    end

    def search
        customers = Customer.where('name like :input or email like :input', input:"%#{params[:input]}%")
        render json:customers
    end
end
