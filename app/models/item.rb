class Item < ApplicationRecord
    has_one_attached :image
    
    has_many :cart_items
    has_many :order_items
    belongs_to :genre
    enum sale_status: { 販売停止中: 0, 販売中: 1 }
    
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
end
