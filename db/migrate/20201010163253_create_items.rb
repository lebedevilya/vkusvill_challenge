class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :count
      t.integer :weight
      t.integer :picker_count
      t.integer :picker_weight
      t.integer :status

      t.timestamps
    end
  end
end
