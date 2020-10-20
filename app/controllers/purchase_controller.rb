class PurchaseController < ApplicationController
  # 購入ボタンを押したら購入者のIDが商品に登録されるメソッド
  def update
    @item_purchaser = Item.find(params[:id])
    @item_purchaser.update(purchaser_id: current_user.id)
  end
end
