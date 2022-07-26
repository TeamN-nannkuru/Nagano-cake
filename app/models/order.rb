class Order < ApplicationRecord
    def shipping
        800
    end
    
    def total_price
        cart_item.total_price
    end
end
