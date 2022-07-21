class Item < ApplicationRecord
    has_one_attached :image
    
    enum sale_status: { stop_selling: 0, now_on_sale: 1 }
end
