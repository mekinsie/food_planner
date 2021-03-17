class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe successfully added!"
      redirect_to recipes_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe successfully updated!"
      redirect_to recipe_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Recipe successfully deleted!"
    redirect_to recipes_path
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name)
    end

end