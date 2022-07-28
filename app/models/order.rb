class Order < ApplicationRecord
    has_one_attached :image
    has_many :order_items

    
    def shipping
        800
    end
    
    def total_price
        cart_item.total_price
    end
end
