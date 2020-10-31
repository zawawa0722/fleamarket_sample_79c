class PurchaseController < ApplicationController

  require 'payjp'

  #購入ボタンを押したら購入者のIDが商品に登録されるメソッド
  def update
    @item_purchaser = Item.find(params[:id])
    @item_purchaser.update(purchaser_id: current_user.id)
  end

  def index
  end

  def purchase
    binding.pry
    Payjp.api_key = "sk_test_9e436f449f36b5118dd8f1dc"
    Payjp::Charge.create(
      amount: 1000,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
