require 'rails_helper'

describe "the add ingredient process" do

  before :each do
    visit '/'
    click_link 'Ingredients'
    click_link 'Create new ingredient'
  end

  it "adds a new ingredient" do
    fill_in 'ingredient_name', :with => 'Salt'
    click_on 'Submit'
    expect(page).to have_content 'Salt'
  end

  it "gives an error when no ingredient name is entered" do
    fill_in 'ingredient_name', :with => ''
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end

end