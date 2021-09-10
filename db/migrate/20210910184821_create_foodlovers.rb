class CreateFoodlovers < ActiveRecord::Migration[6.0]
  def change
    create_table :foodlovers do |t|
      t.string :name

      t.timestamps
    end
  end
end
