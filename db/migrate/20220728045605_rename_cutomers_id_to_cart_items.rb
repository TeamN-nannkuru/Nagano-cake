class RenameCutomersIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :customers_id, :customer_id
  end
end
