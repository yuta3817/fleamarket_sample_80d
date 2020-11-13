class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :product_purchases, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :card, dependent: :destroy
  # validates :nickname, presence: true, uniqueness: true
end
