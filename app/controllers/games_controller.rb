class GamesController < ApplicationController

  def new
    other_game = Game.new(status: "unsolved")
    generated_number = other_game.generate_random_number(params[:level].to_i)
    game = Game.create!(level: params[:level], generated_number: generated_number)
    Rails.logger.info "*"*60
    Rails.logger.info generated_number
    Rails.logger.info "*"*60
    redirect_to game_path(game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def guess
    game = Game.find(params[:id])
    game.guesses ||= 0
    game.guesses += 1
    game.save

    if params[:guess].length != game.level
      redirect_to game_path(game), alert: "You must enter a #{game.level}-digit number! You entered a #{params[:guess].length}-digit number!!"
    else
      result = game.guess(params[:guess])
      if result == [game.generated_number.length, 0]
        game.update_attributes(status: "solved")
        redirect_to root_path, notice: "#{game.generated_number.length} out of #{game.generated_number.length} correct. You won!"
      else
        redirect_to game_path(game), alert: "Number right: #{result[0]} - Number in wrong place: #{result[1]}"
      end
    end
  end

end