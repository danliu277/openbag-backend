class GamesController < ApplicationController
    def index
        games = Game.all.sort_by{|game| game.id}
        render json: games
    end

    def show
        game = Game.find(params[:id]).sort_by{|game| game.id}
        render json: game
    end

    def genre
        games = Game.where(genre: params[:genre])
        render json: games
    end
end
