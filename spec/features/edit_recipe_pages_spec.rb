require 'rails_helper'

describe "the edit recipe process" do
  it "can edit a recipe" do
    @recipe = Recipe.new({:name => 'Pineapple Dish Soup THE GREATEST'})
    @recipe.save
    visit '/recipes'
    # click_link 'Go To Recipes'
    # click_link 'Create new recipe'
    # fill_in 'recipe_name', :with => 'Pineapple Dish Soup'
    # click_on 'Submit'
    click_on 'Pineapple Dish Soup'
    click_on 'Edit recipe name'
    fill_in 'recipe_name', :with => 'The Dogs Milk'
    click_on 'Submit'
    expect(page).to have_content 'The Dogs Milk'
    Recipe.delete_all
  end
end

