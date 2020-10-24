class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :nickname, :family_name, :first_name, :family_name_kana, 
      :first_name_kana, :birthday, :zipcode, :prefectures, :city, :address, :building,
      :address_name1,:address_name2, :phone, presence: true
  has_one :address
end
