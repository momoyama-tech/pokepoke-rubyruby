class CreateDecks < ActiveRecord::Migration[8.0]
  def change
    create_table :decks do |t|
      t.timestamps
    end
  end
end
