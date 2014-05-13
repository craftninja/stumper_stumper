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
    result = game.guess(params[:guess])
    if result == [game.generated_number.length, 0]
      redirect_to root_path, notice: "#{game.generated_number.length} out of #{game.generated_number.length} correct. You won!"
    else
      redirect_to game_path(game), alert: "Number right: #{result[0]} - Number in wrong place: #{result[1]}"
    end
  end

end