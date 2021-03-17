class CreateIngredientsAndRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.timestamps
    end

    create_table :recipes do |t|
      t.string :name
      t.timestamps
    end

    create_table :ingredients_recipes, id: false  do |t|
      t.belongs_to :ingredient
      t.belongs_to :recipe
    end

  end
end
