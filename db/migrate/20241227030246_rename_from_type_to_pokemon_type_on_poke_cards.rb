class RenameFromTypeToPokemonTypeOnPokeCards < ActiveRecord::Migration[8.0]
  def change
    rename_column :poke_cards, :type, :pokemon_type
  end
end
