class DetailController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @images = @Item.item_images
  end

end