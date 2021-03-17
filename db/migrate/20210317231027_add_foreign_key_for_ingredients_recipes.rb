class AddForeignKeyForIngredientsRecipes < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :ingredients_recipes, :ingredients
    add_foreign_key :ingredients_recipes, :recipes
  end
end
