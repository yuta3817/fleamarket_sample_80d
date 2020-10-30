class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :product_images, dependent: :destroy
  with_options presence: true do
    validates :name
    validates :detail
    validates :status_id
    validates :delivery_charge
    validates :prefecture_id
    validates :delivery_date
    validates :price
  end
end
