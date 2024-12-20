class CreateUserPokeCards < ActiveRecord::Migration[8.0]
  def change
    create_table :user_poke_cards do |t|
      t.timestamps
    end
  end
end
