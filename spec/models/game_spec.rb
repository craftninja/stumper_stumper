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

  it 'can return the number right and number in wrong place for 2 digits' do
    game = Game.new(generated_number: "247")
    expect(game.guess("126")).to eq([0, 1])
    expect(game.guess("247")).to eq([3, 0])
    expect(game.guess("222")).to eq([1, 0])
    expect(game.guess("737")).to eq([1, 0])
    expect(game.guess("724")).to eq([0, 3])
    expect(Game.new(generated_number: "242").guess("223")).to eq([1, 1])
    expect(Game.new(generated_number: "74372").guess("43177")).to eq([1, 3])
  end

end