class ProductsController < ApplicationController
  before_action :set_product, only:[:show, :destroy, :edit, :update, :purchase, :payment]


  def index
    @products = Product.includes(:images).order('created_at DESC').where.not(trading_status: 0)
  end  

  def new
    @product = Product.new
    @product.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    
  end

  def destroy
    if @product.destroy 
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to product_path(params[:id]), notice: "権限がありません"
    end
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


  def show
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def edit
  end

  def update
    if@product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def update_done
    @product = Product.where(user_id: current_user.id).last
    @product_update = Product.order("updated_at DESC").first
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


  def set_product
    @product = Product.find(params[:id])
  end  
  def product_params
    params.require(:product).permit(
      :category_id,
      )
  end
end

