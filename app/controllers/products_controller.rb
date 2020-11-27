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
      redirect_to root_path
    else
      render :edit, notice: "削除に失敗しました"
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
    @images = @product.images
    @category_parent_array = Category.where(ancestry: nil)
    @category_grandchild = @product.category
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent

  end

  def edit
    grandchild_category = @product.category
    child_category = grandchild_category.parent    
    if [1, 200, 346, 481, 625, 685, 798, 898, 984, 1093, 1147, 1207, 1270].include?(@category_id)
    else
      # ② ▼ 親カテゴリーのnameとidを配列代入
      @category_parent_array = []
      @category_parent_array << @product.category.parent.parent.name
      @category_parent_array << @product.category.parent.parent.id
    end
      # ③ ▼ 子カテゴリーを全てインスタンス変数へ代入
      @category_children_array = Category.where(ancestry: child_category.ancestry)
      # ④ ▼ 子カテゴリーのnameとidを配列代入
      @category_children_array = []
      Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
      end
      # ⑤ ▼ 孫カテゴリーを全てインスタンス変数へ代入
      @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry) 
      # ⑥ ▼ 孫カテゴリーのnameとidを配列代入
      @category_grandchildren_array = []
      
      Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
      end
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
      :category_id,          #カテゴリ あとでidつける
      :deal_closed_date,  #取引成立日時
      images_attributes: [:image,:_destroy, :id]   #画像複数枚添付用
    )
    .merge(
      seller_id: current_user.id,
      trading_status: 1         #売買状況：売出し中（1）
    )  
  end


  def set_product
    @product = Product.find(params[:id])
  end
end
