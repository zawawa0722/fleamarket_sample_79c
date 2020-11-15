require 'rails_helper'

describe Card do
  describe '#create' do
    it "user_id, customer_id, card_idが存在すれば登録できる" do
      card = build(:card)
      expect(card).to be_valid
    end

    it "user_idがない場合は登録できないこと" do
      card = build(:card, user_id: "")
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end

    it "customer_idがない場合は登録できないこと" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "card_idがない場合は登録できないこと" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end