class Product < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  has_one :product_purchase, dependent: :destroy
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates_associated :product_images, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_date, presence: true
  validates :price, presence: true
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :delivery
end 