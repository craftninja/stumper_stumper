require 'spec_helper'

feature 'Guessing' do

  scenario 'user plays the game' do

    # 246

    visit '/'
    click_on "3"
    fill_in "Your guess", with: "136"
    click_button "Guess"
    expect(page).to have_content("Number right: 1")
    expect(page).to have_content("Number in wrong place: 2")

    fill_in "Your guess", with: "246"
    click_button "Guess"
    expect(page).to have_content("3 out of 3 correct.  You won!")
    within("#results") do
      expect(page).to have_content("3") # level
      expect(page).to have_content("2") # # of guesses
    end

  end

end