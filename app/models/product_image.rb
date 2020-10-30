class ProductImage < ApplicationRecord
  belongs_to :product
  validates :product_id, presence: true
  validates :image, presence: true
end
