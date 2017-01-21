class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.string :sku, null: false
      t.string :supplier_code, null: false
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5
      t.string :field6
      t.decimal :price, null: false, default: 0.0

      t.timestamps

      t.index :sku
      t.index :supplier_code
      t.index [:sku, :supplier_code], unique: true
    end
  end
end
