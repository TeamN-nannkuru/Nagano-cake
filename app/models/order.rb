class Order < ApplicationRecord
    belongs_to :order_item
    
    def shipping
        800
    end
    
    def total_price
        cart_item.total_price
    end
end
