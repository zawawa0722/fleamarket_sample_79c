class FrontController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC').where.not(trading_status: 0)
  end

  def sold
  end

end 



