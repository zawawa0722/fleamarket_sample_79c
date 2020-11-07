class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' } do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana 
  end
  
  validates :nickname, :birthday, presence: true
  
  has_one :address
  has_many :card
  has_many :comments
end
