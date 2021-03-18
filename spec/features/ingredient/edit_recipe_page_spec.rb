require 'rails_helper'

describe "the edit ingredient process" do
  it "can edit a ingredient" do
    @ingredient = Ingredient.new({:name => 'Salt'})
    @ingredient.save
    visit '/ingredients'
    click_on 'Salt'
    click_on 'Edit ingredient'
    fill_in 'ingredient_name', :with => 'Milk'
    click_on 'Submit'
    expect(page).to have_content 'Milk'
  end

  it "gives an error when no ingredient name is entered" do
    @ingredient = Ingredient.new({:name => 'Salt'})
    @ingredient.save
    visit '/ingredients'
    click_on 'Salt'
    click_on 'Edit ingredient'
    fill_in 'ingredient_name', :with => ''
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end
end