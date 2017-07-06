class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.integer :user_id, null: false
      t.integer :pet_id, null: false
      t.timestamps
    end

    add_index :apps, [:pet_id, :user_id], unique: true
  end
end
