class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :item_id
      t.integer :order_id
      t.timestamps
    end
  end
end
