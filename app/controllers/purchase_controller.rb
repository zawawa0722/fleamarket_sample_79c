class PurchaseController < ApplicationController

  # before_action :set_product
  before_action :set_card
  before_action :set_api_key

  require 'payjp'


  def index
    # テスト用 商品詳細表示実装完了後削除
    @product = Product.find(2)
    @address = Address.find(current_user.id)
    @user = User.find(current_user.id)

    if @card.blank?
      flash[:alert] = '購入前にカードを登録してください'
      redirect_to new_card_path
    else
      set_customer
      set_card_infomation
    end
    if current_user.address == nil
      flash[:alert] = '住所を登録してください'
      redirect_to new_address_path
    end
  end

  def show
  end

  def create
    # テスト用 商品詳細表示実装完了後削除
    @product = Product.find(3)

    if Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id, # 顧客ID
      currency: 'jpy'
    )
      @product.save(buyer_id: current_user.id) #productテーブルのbuyer_idカラムにcurrent_userのidを保存
      redirect_to action: 'complete' #購入が成功したら完了画面へ遷移
    else
      redirect_to new_card_path #失敗したらカード登録画面に遷移
    end
  end

  def complete
  end

  # def edit
  #   @product = Product.find(3, buyer_id: current_user.id)
  # end

  # def update
  #   @product = Product.find(3, buyer_id: current_user.id)
  #   @product.update
  # end

  private
    def set_product #商品情報と配送先住所の取得
      @product = Product.find(params[:id])
      @address = Address.find(current_user.id)
    end

    def set_card #各アクション内でuser_idとDBに保存されたcard情報を紐付け
      @card = Card.find_by(user_id: current_user.id)
    end

    def set_api_key #APIキーの取得
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    end

    def set_customer  #購入確認画面でカード情報を表示するための変数
      @customer = Payjp::Customer.retrieve(@card.customer_id)
    end

    def set_card_infomation #購入確認画面でカード情報を表示するための変数
      @card_information = @customer.cards.retrieve(@card.card_id) #購入確認画面でカード情報を表示するための変数
    end

    def product_params
      params.require(:product).permit(:product_id, :price
      )
      .merge(
        user_id: current_user.id,
      )
    end
  end

