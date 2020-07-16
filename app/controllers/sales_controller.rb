class SalesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        sales = Sale.all
        render json: sales
    end

    def show
        sale = Sale.find(params[:id])
        render json: sale
    end

    def top_five
        games = Hash[Sale.group(:game_id).count.sort_by{|k,v| -v}.first(3)].keys.map{|id| Game.find(id)}
        render json: games
    end

    def createSales
        sales = params[:sales][:games].map do |sale_game|
            Sale.create(employee_id: params[:sales][:employee_id], customer_id: params[:sales][:customer_id], game_id: sale_game[:id], quantity: sale_game[:quantity])
            game = Game.find(sale_game[:id])
            game.stock-=sale_game[:quantity]
            game.save
        end
        render json: sales
    end
end