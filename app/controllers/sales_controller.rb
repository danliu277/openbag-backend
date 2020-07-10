class SalesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        sales = Sales.all
        render json: sales
    end

    def show
        sale = Sales.find(params[:id])
        render json: sale
    end

    def createSales
        sales = params[:sales][:games].map do |game|
            Sales.create(employee_id: params[:sales][:employee_id], customer_id: params[:sales][:customer_id], game_id: game[:id], quantity: 1)
        end
        render json: sales
    end
end
