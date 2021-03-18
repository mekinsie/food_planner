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
    if params[:recipe_id] != nil
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = @recipe.ingredients.new(ingredient_params)
      if @ingredient.save
        @recipe.ingredients <<  @ingredient
        flash[:notice] = "You Saved!"
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
    else
      @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
        flash[:notice] = "You Saved!"
        redirect_to ingredients_path
      else
        render :new
      end
    end
  end

  def destroy
    if params[:recipe_id] != nil
      recipe = Recipe.find(params[:recipe_id])
      ingredient = Ingredient.find(params[:id])
      ingredient.destroy
      redirect_to recipe_path(@recipe)
    else
      ingredient = Ingredient.find(params[:id])
      ingredient.destroy
      redirect_to ingredients_path
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if params[:recipe_id] != nil
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = Ingredient.find(params[:id])
      if @ingredient.update(ingredient_params)
        flash[:notice] = "Successfully updated ingredient"
        redirect_to recipe_path(@recipe)
      else
        render :edit
      end
    else
      if @ingredient.update(ingredient_params)
        flash[:notice] = "Successfully updated ingredient"
        redirect_to ingredient_path(@ingredient)
      else
        render :edit
      end
    end
  end

  def edit
    if params[:recipe_id] != nil
      @ingredient = Ingredient.find(params[:id])
      @recipe = Recipe.find(params[:recipe_id])
    else
      @ingredient = Ingredient.find(params[:id])
    end
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