class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :zipcode, presence: true, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/}

  validates :prefectures, :city, :address, :address_name1, :address_name2, presence: true

  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
    validates :phone, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

end