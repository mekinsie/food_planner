require 'rails_helper'

describe "the add recipe process" do
  it "adds a new recipe" do
    visit '/'
    click_link 'Go To Recipes'
    click_link 'Create new recipe'
    fill_in 'recipe_name', :with => 'Pineapple Dish'
    click_on 'Submit'
    expect(page).to have_content 'Pineapple Dish'
  end

  # it "gives an error when no recipe name is entered" do
  #   visit new_album
  # end



end