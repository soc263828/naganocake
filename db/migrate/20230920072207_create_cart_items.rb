class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :amount, :item_id, :customer_id, null: false

      t.timestamps
    end
  end
end
