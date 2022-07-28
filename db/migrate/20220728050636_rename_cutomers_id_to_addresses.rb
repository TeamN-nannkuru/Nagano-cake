class RenameCutomersIdToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :customers_id, :customer_id
    rename_column :orders, :customers_id, :customer_id
  end
end
