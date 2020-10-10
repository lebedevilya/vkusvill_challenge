class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :barcode, null: false
      t.integer :type
      t.integer :weight
      t.text :manufacturer
      t.integer :price, null: false
      t.text :composition
      t.text :photo
      t.references :category

      t.timestamps
    end
  end
end
