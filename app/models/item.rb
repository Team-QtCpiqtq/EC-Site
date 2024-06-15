class Item < ApplicationRecord
    has_one_attached :image
    validates :image, presence: true
    has_many :cart_items, dependent: :destroy
end
