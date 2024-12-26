class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.references :target_user, foreign_key: { to_table: :users }
      t.string :name
      t.integer :status, limit: 1, default: 0

      t.timestamps
    end
  end
end
