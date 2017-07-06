class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :pet_id, null: false
      t.timestamps
    end

    add_index :favorites, [:pet_id, :user_id], unique: true
  end
end
