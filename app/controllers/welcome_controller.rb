class WelcomeController < ApplicationController

  def index
    @games = Game.all
  end

  def about
    @examples = [
      [247, 126, [0, 1]],
      [247, 247, [3, 0]],
      [247, 222, [1, 0]],
      [247, 737, [1, 0]],
      [247, 724, [0, 3]],
      [242, 223, [1, 1]],
      [74372, 43177, [1, 3]]
    ]
  end

end