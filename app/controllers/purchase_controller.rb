class PurchaseController < ApplicationController

  # before_action :set_product
  before_action :set_card

  require 'payjp'


  def index
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    @card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@card.customer_id) #顧客情報の取得
    @card_information = customer.cards.retrieve(@card.card_id) #購入確認画面でカード情報を表示するための変数
    # @products = Product.includes(:images).order('created_at DESC').where.not(trading_status: 0)
    @product = Product.find(3)
    @address = Address.find(current_user.id)
    @user = User.find(current_user.id)
  end

  def show
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    @product = Product.find(3)
    if Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id, # 顧客ID
      currency: 'jpy'
    )
      @product.save(buyer_id: current_user.id) #productテーブルのbuyer_idカラムにcurrent_userのidを保存
      redirect_to complete_index_path #購入が成功したら完了画面へ遷移
    else
      redirect_to new_card_path #失敗したらカード登録画面に遷移
    end
  end

  private
    def set_product #商品情報の取得
      @product = Product.find(params[:id])
    end

    def set_card #各アクション内でuser_idとDBに保存されたcard情報を紐付け
      @card = Card.find_by(user_id: current_user.id)
    end
  end

