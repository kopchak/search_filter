class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string  :color
      t.string  :material
      t.integer :price
      t.integer :weight
      t.integer :height
      t.integer :width
      t.boolean :fragile
      t.boolean :fast_delivery
      t.integer :discount
      t.integer :amount
      t.integer :product_id, index: true

      t.timestamps null: false
    end
  end
end
