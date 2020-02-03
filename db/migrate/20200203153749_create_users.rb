class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :icon_type
      t.string :name
      t.string :key1
      t.string :key2
      t.string :favorite_food1
      t.string :favorite_food2
      t.string :favorite_food3
      t.string :favorite_food4
      t.string :favorite_food5
    end
  end
end
