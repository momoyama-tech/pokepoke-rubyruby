class CreateUsersPokeCards < ActiveRecord::Migration[8.0]
  def change
    create_table :users_poke_cards do |t|
      t.references :user, foreign_key: true
      t.references :poke_card, foreign_key: true
      t.integer :count, default: 0
      t.timestamps
    end
  end
end
