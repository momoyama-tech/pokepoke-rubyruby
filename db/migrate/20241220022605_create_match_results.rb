class CreateMatchResults < ActiveRecord::Migration[8.0]
  def change
    create_table :match_results do |t|
      t.references :user, foreign_key: true
      t.references :target_user, foreign_key: { to_table: :users }
      t.integer :result, limit: 1

      t.timestamps
    end
  end
end
