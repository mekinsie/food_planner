class Ingredient < ApplicationRecord
  before_save :titleize_ingredient

  validates :name, presence: true

  has_and_belongs_to_many(:recipes)

  # scope: ordered_ingredients, -> { select("ingredients.name").order("ASC")}

  private
    def titleize_ingredient
      self.name = self.name.titleize
    end
end