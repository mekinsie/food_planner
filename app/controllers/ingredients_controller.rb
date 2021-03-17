class IngredientsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "You Saved!"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Could Not Update..."
      redirect_to recipe_path(@ingredient.recipe)
    else
      @recipe = Recipe.find(params[:recipe_id])
      render :edit
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    render :edit
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    render :show
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end