class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :postage, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :name, null: false
      t.integer :payment_method, null: false
      t.integer :charge, null: false
      t.integer :customer_id

      t.timestamps
    end
  end
end
