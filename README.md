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
|email|string|null:false,uniqueness:true|
|password|string|null:false,uniqueness:true|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birthday_year|integer|null:false|
|birthday_month|integer|null:false|
|birthday_day|integer|null:false|

##  Association

-has_many :comments
-has_many :pays
-has_many :address
-has_many :user_items
-has_many :items

## paysテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|null:false|
|card_number|string|null:false,uniqueness:true|
|year|integer|null:false|
|month|integer|null:false|
|security_number|integer|null:false|

##  Association

-belongs to :user

##  addressテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|null:false|
|prefecture_id|reference|null:false|
|municipalitie|string|null:false|
|address|string|null:false|
|building|string|null:false|
|phone_number|integer|null:false|

##  Association

-belongs to :user

##  Itemsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|null:false,foreign_key|
|name|string|null:false|
|price|string|null:false|
|category_id|reference|null:false|
|brand_id|reference||
|condition_id|reference|null:false|
|comment|text|null:false|
|shopping_charge|field|null:false|
|prefecture_id|reference|null:false|
|shopping_date|field|null:false|

##  Association

-has_many :user_items
-has_many :comments
-belongs to :user

##  user_itemsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|null:false,foreign_key|
|item_id|reference|null:false,foreign_key|

##  Association

-belongs to :item
-belongs to :user

## commentsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|reference|null:false|
|item_id|reference|null:false|
|comment|text|null:false|

##  Association

-belongs to :user
-belongs to :item

##  imagesテーブル

|Column|Type|Option|
|------|----|------|
|item_id|reference|null:false|
|image|field|null:false|

##  Association

-belong to :item