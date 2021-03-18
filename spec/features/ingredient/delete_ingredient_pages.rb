require 'rails_helper'

describe "the delete ingredient proccess" do
  it "deletes a ingredient when commanded to" do
    @ingredient = Ingredient.new({:name => 'Apple'})
    @ingredient.save
    visit '/ingredients'
    click_on 'Apple'
    click_on 'Delete ingredient'
    expect(page).to have_content 'ingredients'
    expect(page).to have_no_content 'Apple'
  end
end