class DeckRecipesController < ApplicationController
  def index
    @deck_recipes = DeckRecipe.all
  end

  def show
    @deck_recipe = DeckRecipe.find(params[:id])
  end

  def new
    @deck_recipe = DeckRecipe.new
  end

  def create
    @deck_recipe = DeckRecipe.new(deck_recipe_params)

    if @deck_recipe.save
      redirect_to deck_recipes_path, notice: "デッキレシピ: #{@deck_recipe.name} を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @deck_recipe = DeckRecipe.find(params[:id])
    @name = @deck_recipe.name
    @deck_recipe.destroy
    redirect_to deck_recipes_path, notice: "デッキレシピ #{@name} を削除しました"
  end

  private
  def deck_recipe_params
    params.require(:deck_recipe).permit(:name)
  end
end
