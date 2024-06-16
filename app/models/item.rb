class Item < ApplicationRecord
    has_one_attached :image
    validates :image, presence: true
    has_many :cart_items, dependent: :destroy
    
    def with_tax_price
        (price * 1.1).floor
    end
end
