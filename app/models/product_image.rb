class ProductImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
  validates :product_id, presence: true
  validates :image, presence: true
end
