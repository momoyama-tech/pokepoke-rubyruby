class CreateDeckRecipesPokeCards < ActiveRecord::Migration[8.0]
  def change
    create_table :deck_recipes_poke_cards do |t|
      t.references :deck_recipe, foreign_key: true
      t.references :poke_card, foreign_key: true

      t.timestamps
    end
  end
end
