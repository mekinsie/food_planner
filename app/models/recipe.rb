class Recipe < ApplicationRecord
  before_save :titleize_recipe

  validates :name, presence: true

  has_and_belongs_to_many(:ingredients)

  private
    def titleize_recipe
      self.name = self.name.titleize
    end
end