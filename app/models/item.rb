class Item < ApplicationRecord
    has_one_attached :image
    has_many :cart_items
    has_many :order_items
    
    enum sale_status: { stop_selling: 0, now_on_sale: 1 }
end
