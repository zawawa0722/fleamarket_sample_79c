class DetailController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC').where.not(trading_status: 0)

    @product = product.find(params[:id])
  end

end