class CreatePokeCards < ActiveRecord::Migration[8.0]
  def change
    create_table :poke_cards do |t|
      t.timestamps
    end
  end
end
