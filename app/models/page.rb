class Page < ApplicationRecord
  # scope :how_many_recipes, -> { Recipe.all.length }
  # scope :how_many_ingredients, -> { Ingredient.all.length }
  # scope :contain_milk, -> {(
  # milk_id = select("ingredients.id").where("ingredients.name = ?", "milk" )
  # recipe_id = select("ingredients_recipes.recipe_id").where("ingredients_recipes.ingredient_id = ?", "#{milk_id.first}")
  # select("recipes.name").where("recipes.id = ?", "#{recipe_id.first}")
  # )}
  # binding.pry
end
