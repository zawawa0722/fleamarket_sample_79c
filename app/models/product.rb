class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  enum size: { XS: 0, S: 1, M: 2, L: 3, XL: 4, XL以上: 5, フリーサイズ: 6 }
  enum product_status: { 新品・未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5 }
  enum shipping_fee: { 送料込み（出品者負担）: 0, 着払い（購入者負担）: 1}
  enum shipping_day: { １〜２日で発送: 0, ２〜３日で発送: 1, ４〜７日で発送: 2}
  enum shipping_type: { 未定: 0, 普通郵便（定形／定形外）: 1, ゆうパック: 2}


  validates :product_name,  presence: { message: "を入力してください"}, length: { maximum: 40 }
  validates :description,  presence: { message: "を入力してください"}
  validates :price, presence: { message: "を入力してください"}
  validates :price, numericality: { greater_than:  299, less_than: 50001 } 
  validates :product_status,  presence: { message: "を入力してください"}
  validates :prefecture_id,  presence: { message: "を入力してください"}
  validates :shipping_day,  presence: { message: "を入力してください"}
  validates :shipping_type,  presence: { message: "を入力してください"}
  validates :shipping_fee,  presence: { message: "を入力してください"}
  validates :category,  presence: { message: "を入力してください"}
  validates :trading_status,  presence: { message: "を入力してください"}
  ##validates :seller_id,  presence: { message: "を入力してください"}

  # validates_associated :images
  validates :images, presence: true

  # accepts_nested_attributes_for :images, allow_destroy: true

end
