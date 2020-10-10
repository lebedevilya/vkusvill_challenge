class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :count, null: false, defaut: 1
      t.integer :weight
      t.integer :picker_count, null: false, default: 0
      t.integer :picker_weight
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
