class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :logo_id
      t.integer :order_id
      t.float :unit_price
      t.float :total_price

      t.timestamps
    end
  end
end
