class Game < ActiveRecord::Base

  def result
    2
  end

  def generate_random_number(level)
    r = "#{rand(1..9)}#{rand(0..9)}" if level == 2
    r = "#{rand(1..9)}#{rand(0..9)}#{rand(0..9)}" if level == 3
    r = "#{rand(1..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}" if level == 4
    r = "#{rand(1..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}" if level == 5
    r
  end

end