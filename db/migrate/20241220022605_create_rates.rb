class CreateRates < ActiveRecord::Migration[8.0]
  def change
    create_table :rates do |t|
      t.timestamps
    end
  end
end
