class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :color
      t.integer :price
      t.integer :weight
      t.integer :height
      t.integer :width
      t.string  :material
      t.boolean :fragile
      t.boolean :fast_delivery
      t.integer :discount
      t.integer :amount

      t.timestamps null: false
    end
  end
end
