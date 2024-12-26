class CreateDeckRecipesPokeCards < ActiveRecord::Migration[8.0]
  def change
    create_table :deck_recipes_poke_cards do |t|
      t.timestamps
    end
  end
end
