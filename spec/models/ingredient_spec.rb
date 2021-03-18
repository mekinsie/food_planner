require 'rails_helper'

describe Ingredient do

  it { should have_and_belong_to_many :recipes }

  it { should validate_presence_of :name }

  it "should titleize the name value" do
    ingredient = Ingredient.create({name: "the dogs salt"})
    expect(ingredient.name).to eq "The Dogs Salt"
  end
end