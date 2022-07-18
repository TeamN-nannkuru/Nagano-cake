class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customers_id
      t.integer :shipping
      t.integer :billing_amount
      t.string :payment_method
      t.string :receriver_name
      t.text :ordered_address
      t.string :ordered_postal_code
      t.string :order_status
      
      t.timestamps
    end
  end
end
