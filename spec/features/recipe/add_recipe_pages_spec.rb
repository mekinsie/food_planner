require 'rails_helper'

describe "the add recipe process" do

  before :each do
    visit '/'
    click_link 'Recipes'
    click_link 'Create new recipe'
  end

  it "adds a new recipe" do
    fill_in 'recipe_name', :with => 'Pineapple Dish'
    click_on 'Submit'
    expect(page).to have_content 'Pineapple Dish'
  end

  it "gives an error when no recipe name is entered" do
    fill_in 'recipe_name', :with => ''
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end
end