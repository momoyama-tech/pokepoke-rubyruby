class CreateRates < ActiveRecord::Migration[8.0]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.integer :result, limit: 1

      t.timestamps
    end
  end
end
