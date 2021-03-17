require 'rails_helper'

describe Recipe do
  # talking about the database
  it { should have_and_belong_to_many :ingredients }

  #checks valid name
  it { should validate_presence_of :name }

  it "should titleize the name value" do
    recipe = Recipe.create({name: "the dogs salt"})
    expect(recipe.name).to eq "The Dogs Salt"
  end
end