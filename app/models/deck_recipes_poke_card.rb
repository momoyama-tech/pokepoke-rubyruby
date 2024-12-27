class DeckRecipesPokeCard < ApplicationRecord
  belongs_to :deck_recipe
  belongs_to :poke_card
end
