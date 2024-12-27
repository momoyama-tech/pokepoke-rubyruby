class AddColumnToPokeCards < ActiveRecord::Migration[8.0]
  def change
    add_column :poke_cards, :hp, :integer
    add_column :poke_cards, :evolution_level, :string
    add_column :poke_cards, :type, :string
    add_column :poke_cards, :weakness, :string
    add_column :poke_cards, :basic_evolution, :string
    add_column :poke_cards, :first_evolution, :string
    add_column :poke_cards, :second_evolution, :string
  end
end
