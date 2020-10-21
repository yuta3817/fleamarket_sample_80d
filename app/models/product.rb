class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :product_image, dependent::destory
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
end
