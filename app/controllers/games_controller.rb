class GamesController < ApplicationController

  def new
    other_game = Game.new
    generated_number = other_game.generate_random_number(params[:level].to_i)
    game = Game.create!(level: params[:level], generated_number: generated_number)
    redirect_to game_path(game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def guess
    game = Game.find(params[:id])
    if params[:guess] == game.generated_number
      redirect_to root_path, notice: "3 out of 3 correct. You won!"
    else
      redirect_to game_path(game), alert: "Number right: 1 - Number in wrong place: 2"
    end
  end

end