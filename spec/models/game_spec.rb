require 'spec_helper'

describe Game do
  it 'can generate a 2 digit random number' do
    srand(1)
    game = Game.new
    actual = game.generate_random_number(2)
    expected = "68"
    expect(actual).to eq(expected)
  end
  it 'can generate a 3 digit random number' do
    srand(1)
    game = Game.new
    actual = game.generate_random_number(3)
    expected = "689"
    expect(actual).to eq(expected)
  end
  it 'can generate a 4 digit random number' do
    srand(1)
    game = Game.new
    actual = game.generate_random_number(4)
    expected = "6895"
    expect(actual).to eq(expected)
  end
  it 'can generate a 5 digit random number' do
    srand(1)
    game = Game.new
    actual = game.generate_random_number(5)
    expected = "68950"
    expect(actual).to eq(expected)
  end
  after do
    srand(Random.new_seed)
  end

end