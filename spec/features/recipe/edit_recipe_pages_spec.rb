require 'rails_helper'

describe "the edit recipe process" do
  it "can edit a recipe" do
    @recipe = Recipe.new({:name => 'Pineapple Soup'})
    @recipe.save
    visit '/recipes'
    click_on 'Pineapple Soup'
    click_on 'Edit recipe name'
    fill_in 'recipe_name', :with => 'The Dogs Milk'
    click_on 'Submit'
    expect(page).to have_content 'The Dogs Milk'
  end

  it "gives an error when no recipe name is entered" do
    @recipe = Recipe.new({:name => 'Pineapple Soup'})
    @recipe.save
    visit '/recipes'
    click_on 'Pineapple Soup'
    click_on 'Edit recipe name'
    fill_in 'recipe_name', :with => ''
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end
end