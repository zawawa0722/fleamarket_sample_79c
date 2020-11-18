class DetailController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC').where.not(trading_status: 0)
    @category_parent_array = Category.where(ancestry: nil)
  end

  def show
  @category_id = @product.category_id
  @category_parent = Category.find(@category_id).parent.parent
  @category_child = Category.find(@category_id).parent
  @category_grandchild = Category.find(@category_id)
  end

end