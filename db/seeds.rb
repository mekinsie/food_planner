require 'faker'

Recipe.destroy_all
Ingredient.destroy_all

100.times do
  recipe = Recipe.create!(name: Faker::Food.dish)
  10.times do
    ingredient = Ingredient.create!(name: Faker::Food.ingredient)
    recipe.ingredients <<  ingredient
  end
end

p "Created #{Recipe.count} recipes and #{Ingredient.count} ingredients."
