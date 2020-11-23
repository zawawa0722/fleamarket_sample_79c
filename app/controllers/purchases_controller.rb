class PurchasesController < ApplicationController

  before_action :set_product 
  before_action :set_card
  before_action :set_api_key

  require 'payjp'


  def index
    @images = @product.images
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
    @images = @product.images
    if Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id, # 顧客ID
      currency: 'jpy'
    )
      @product.update(buyer_id: current_user.id) #productテーブルのbuyer_idカラムにcurrent_userのidを保存
    else
      redirect_to new_card_path #失敗したらカード登録画面に遷移
    end
  end

  private
    def set_product #商品情報と配送先住所の取得
      @product = Product.find(params[:product_id])
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
      params.require(:product).permit(
        :product_name,      #商品名
        :description,       #商品説明   
        :price,             #価格
        :brand,             #ブランド名 あとでidつける
        :product_status,    #商品の状態
        :prefecture_id,     #都道府県
        :size,              #サイズ
        :shipping_fee,      #配送料 
        :shipping_day,      #発送までの日数
        :shipping_type,     #配送方法
        :category_id,          #カテゴリ あとでidつける
        :deal_closed_date,  #取引成立日時
        images_attributes: [:image,:_destroy, :id]   #画像複数枚添付用
      )
      .merge(
        seller_id: current_user.id,
        trading_status: 1         #売買状況：売出し中（1）
      )  
    end  
  end

