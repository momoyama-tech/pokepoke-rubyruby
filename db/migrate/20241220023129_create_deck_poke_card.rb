class CreateDeckPokeCard < ActiveRecord::Migration[8.0]
  def change
    create_table :deck_poke_card do |t|
      t.integer :count, default: 0
      t.timestamps
    end
  end
end
