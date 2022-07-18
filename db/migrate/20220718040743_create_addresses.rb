class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customers_id
      t.string :receriver_name
      t.text :ordered_address
      t.string :ordered_postal_code
      
      t.timestamps
    end
  end
end
