class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps

      t.index :code, unique: true
    end
  end
end
