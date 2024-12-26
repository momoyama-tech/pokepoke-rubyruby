class CreateDecksPokeCards < ActiveRecord::Migration[8.0]
  def change
    create_table :decks_poke_cards do |t|
      t.integer :count, default: 0
      t.timestamps
    end
  end
end
