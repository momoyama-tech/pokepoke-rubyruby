class CreateDeckRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :deck_recipes do |t|
      t.timestamps
    end
  end
end
