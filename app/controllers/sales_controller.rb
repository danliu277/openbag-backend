class SalesController < ApplicationController
    def index
        sales = Sales.all
        render json: sales
    end

    def show
        sale = Sales.find(params[:id])
        render json: sale
    end
end
