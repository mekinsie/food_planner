class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    render :index
  end

  def new
    if params[:recipe_id] != nil
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
    else
      @ingredient = Ingredient.new
    end
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      recipe.ingredients <<  @ingredient
      flash[:notice] = "You Saved!"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Could Not Update..."
      redirect_to recipe_path(@recipe)
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
    if params[:recipe_id] != nil
      @ingredient = Ingredient.find(params[:id])
      @recipe = Recipe.find(params[:recipe_id])
    else
      @ingredient = Ingredient.find(params[:id])
    end
      render :show
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end