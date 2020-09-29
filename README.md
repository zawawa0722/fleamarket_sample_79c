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

##  usersテーブル

|Column|Type|Option|
|------|----|------|
|nickname|string|null:false|
|email|string|null:false,unique:true:true|
|password|string|null:false,unique:true:true|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birthday_year|integer|null:false|
|birthday_month|integer|null:false|
|birthday_day|integer|null:false|

##  Association

-has_many :addresses
-has_many :exhibitors
-has_many :items
-has_many :comments

##  addressesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|
|prefecture_id|reference|
|municipalities|string|null:false|
|address|string|null:false|
|building|string|null:false|
|phone_number|integer|null:false|

##  Association

-belongs to :users
-belongs to :prefectures

##  prefecturesテーブル

|Column|Type|Option|
|------|----|------|
|prefecture|string|null:false|

##  Association

-has_many :address
-has_many :items



##  itemsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|foreign_key|
|name|string|null:false|
|price|string|null:false|
|category_id|reference|foreign_key|
|brand_id|reference|foreign_key|
|condition_id|reference|foreign_key|
|comment|text|null:false|
|shopping_charge|field|null:false|
|prefecture_id|reference|foreign_key|
|shopping_date|field|null:false|

##  Association

-has_many :exhibitors
-has_many :comments
-has_many :images
-belongs to :users
-belongs to :categories
-belongs to :brands
-belongs to :conditions

##  exhibitorsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|foreign_key|
|item_id|reference|foreign_key|

##  Association

-belongs to :items
-belongs to :users

## commentsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|null:false|
|item_id|reference|null:false|
|comment|text|null:false|

##  Association

-belongs to :users
-belongs to :items

##  imagesテーブル

|Column|Type|Option|
|------|----|------|
|item_id|reference|null:false|
|image|field|null:false|

##  Association

-belong to :item

##  categoriesテーブル

|Column|Type|Option|
|------|----|------|
|category|string|null:false|

##  Association

-has_many :items

##  brandsテーブル

|Column|Type|Option|
|------|----|------|
|brand|string|null:false|

##  Association

-has_many :items

##  conditionsテーブル

|Column|Type|Option|
|------|----|------|
|condition|string|null:false|

##  Association

-has_many :items
