class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
