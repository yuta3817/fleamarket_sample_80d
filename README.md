# README

# fleamarket_sample_80d DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null:false|

### Association
- has_many :products
- has_many :buyings
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|zip_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|town|string|null:false|
|number|string|null:false|
|building|string||
|telephone|string||
|user_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|category_id|references|null: false,foreign_key: true|
|brand|string||
|status|string|null:false|
|delivery_charge|integer|null:false|
|shipping_area|string|null:false|
|delivery_date|integer|null:false|
|price|integer|null:false|
|user_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_one :buying
- has_many :images

## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false,foreign_key: true|
|image|text|null: false|

### Association
- belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|ancestry|string||

### Association
- has_many :products

## buyingsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|product_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

