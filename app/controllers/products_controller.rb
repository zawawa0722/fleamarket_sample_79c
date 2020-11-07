class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC').where.not(trading_status: 0)
  end  

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    unless @product.save
      @product.images.clear
      @product.images.build if @product.images.blank?   #画像が一枚も投稿されていない場合buildメソッドを実行
      render :new
    else
      @images = @product.images
    end
  end

  def edit
  end

  def update
  end


private
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
      :category,          #カテゴリ あとでidつける
      :deal_closed_date,  #取引成立日時
      images_attributes: [:image,:_destroy, :id]   #画像複数枚添付用
    )
    .merge(
      user_id: current_user.id,
      trading_status: 1         #売買状況：売出し中（1）
    )  
  end

end
