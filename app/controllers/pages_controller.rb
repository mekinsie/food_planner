class PagesController < ApplicationController
  def index
    @recipes_total = Recipe.all.length
    @ingredients_total = Ingredient.all.length
    render :index
  end
end