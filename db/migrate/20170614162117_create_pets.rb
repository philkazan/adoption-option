class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal
      t.string :breed
      t.string :size
      t.string :sex
      t.string :location
      t.string :age
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
