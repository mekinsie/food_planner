require 'rails_helper'

describe "the delete recipe proccess" do
  it "deletes a recipe when commanded to" do
    @recipe = Recipe.new({:name => 'Pineapple Soup'})
    @recipe.save
    visit '/recipes'
    click_on 'Pineapple Soup'
    click_on 'Delete recipe'
    expect(page).to have_content 'Recipes'
    expect(page).to have_no_content 'Pineapple Soup'
  end
end