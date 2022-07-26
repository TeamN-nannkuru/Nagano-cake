class Order < ApplicationRecord
    def shipping
        800
    end
    
    def total_price
        billing_amount + shipping
    end
end
