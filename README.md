# README

# fleamarket_sample_80d DB設計

## userテーブル
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
|address_first_name|string|null:false|
|address_last_name|string|null:false|
|address_first_name_kana|string|null:false|
|address_last_name_kana|string|null:false|
|zip_code|integer|null:false|
|address_prefecture|string|null:false|
|address_city|string|null:false|
|address_town|string|null:false|
|address_number|string|null:false|
|address_building|string||
|address_telephone|integer||
|card_id|string|null:false|

### Association
- has_many :products
- has_many :buyings

## productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|category|string|null: false|
|image|text|null: false|
|brand|string||
|status|string|null:false|
|delivery_charge|integer|null:false|
|shipping_area|string|null:false|
|delivery_date|integer|null:false|
|price|integer|null:false|
|user_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_one :buying

## buyingテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|goods_id|references|null: false,foreign_key: true|
|buy_day|date|null:false|

### Association
- belongs_to :user
- has_one :product