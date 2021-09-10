class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :foodlover_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
