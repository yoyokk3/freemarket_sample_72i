# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## テーブルの設計図
![フリマ ER 図](https://user-images.githubusercontent.com/61731113/78019967-85c2b580-738b-11ea-9fb8-308acf8d10d5.jpeg)


## usersテーブル
|Column            |Type   |Option                  |
|------------------|------ |------------------------|
|first_name        |string |null: false             |
|last_name         |string |null: false             |
|email             |string |null: false, default: ""|
|encrypted_password|string |null: false, default: ""|
|first_name_kana   |string |null: false             |
|last_name_kana    |string |null: false             |
|nickname          |string |null: false             |
|iamge             |text   |                        |
|mail_address      |string |null: false             |
|birthday_year     |integer|null: false             |
|birthday_manth    |integer|null: false             |
|birthday_day      |integer|null: false             |

### Association
- has_one  :card
- has_many :likes
- has_many :products
- has_many :addresses


## addressesテーブル
|Column            |Type   |Option     |
|------------------|-------|-----------|
|first_name        |string     |null: false                  |
|last_name         |string     |null: false                  |
|first_name_kana   |string     |null: false                  |
|last_name_kana    |string     |null: false                  |
|postal_code       |integer    |null: false                  |
|prefectures       |string     |null: false                  |
|municipality      |string     |null: false                  |
|house_number      |string     |null: false                  |
|apartment_name    |string     |null: false                  |
|call_number       |integer    |null: false, unique: true    |
|user_id           |references |null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product

## productsテーブル
|Column|Type|Option|
|------|----|------|
|name       |string    |null: false|
|price      |integer   |null: false|
|status     |integer   |null: false|
|description|text      |null: false|
|sending    |integer   |null: false|
|send_cost  |integer   |null: false|
|user_id    |references|null: false|
|category_id|references|null: false|
|brand_id   |references|null: false|


statusはenumで管理
Productモデルでbrand_new(新品), very_good(良), good(可)とした

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_one    :address
- has_many   :likes
- has_many   :images


## categoriesテーブル

|Column         |Type  |Options|
|---------------|------|       |
|category_name  |string|       |
|category_detail|string|       |

### Association
- has_many :products


## brandsテーブル

|Column    |Type  |Options|
|----------|------|       |
|brand_name|string|       |

### Association
- has_many :products


## cardsテーブル

|Column         |Type  |Options|
|--------------|---------|                              |
|card_number   |integer  |null: false                   |
|cbrand        |string   |null: false                   |
|deadline_year |integer  |null: false                   |
|deadline_manth|integer  |null: false                   |
|name-onCard   |string   |null: false                   |
|security_code |integer  |null: false                   |
|user_id       |reference|null: false, foreign_key: true|

### Association
- belongs_to :user


## imagesテーブル

|Column |Type      |Options                       |
|-------|----------|                              |
|image  |text      |null: false                   |
|user_id|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :product

## likesテーブル

|Column    |Type      |Options                       |
|----------|----------|                              |
|user_id   |references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

