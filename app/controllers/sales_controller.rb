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
        games = Hash[Sale.group(:game_id).count.sort_by{|k,v| -v}.first(5)].map do |k, v|
            today = Date.today
            {
                'game' => Game.find(k),
                'sales' => [11,10,9,8,7,6,5,4,3,2,1,0].map do |x|
                    new_date = today.prev_month(x)
                    date_range = new_date.beginning_of_month..new_date.end_of_month
                    {
                        'date': "#{Date::MONTHNAMES[new_date.month]}-#{new_date.year}",
                        'sales': Sale.where(:created_at =>  date_range, game_id: k).count
                    }
                end
            }
        end

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