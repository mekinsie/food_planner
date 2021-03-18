require 'rails_helper'

describe "the add ingredient to recipe process" do
  it "adds a new ingredient to a recipe" do
    @recipe = Recipe.new({:name => 'Pineapple Soup'})
    @recipe.save
    visit '/recipes'
    click_link 'Pineapple Soup'
    click_link 'Add an ingredient'
    fill_in 'ingredient_name', :with => "Salt"
    click_on 'Submit'
    expect(page).to have_content "Salt"
  end
end