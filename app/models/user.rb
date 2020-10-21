class User < ApplicationRecord
  has_many :product, dependent::destory
  has_one :address, dependent::destory
end
