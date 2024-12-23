class DeckRecipesController < ApplicationController
  def index
    @deck_recipes = DeckRecipe.all
  end
end
