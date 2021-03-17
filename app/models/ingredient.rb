class Ingredient < ApplicationRecord
  before_save :titleize_ingredient

  validates :name, presence: true

  has_and_belongs_to_many(:recipes)

  private
    def titleize_ingredient
      self.name = self.name.titleize
    end
end