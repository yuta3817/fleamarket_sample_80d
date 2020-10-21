class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :product_purchase, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :delivery
end 