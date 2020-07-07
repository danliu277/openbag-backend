class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games
    end

    def show
        game = Game.find(params[:id])
        render json: game
    end

    def genre
        games = Game.where(genre: params[:genre])
        render json: games
    end
end
