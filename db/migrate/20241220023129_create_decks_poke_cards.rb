class CreateDecksPokeCards < ActiveRecord::Migration[8.0]
  def change
    create_table :decks_poke_cards do |t|
      t.references :deck, foreign_key: true
      t.references :poke_card, foreign_key: true

      t.timestamps
    end
  end
end
