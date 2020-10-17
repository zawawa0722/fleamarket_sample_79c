class ItemsController < ApplicationController

  def index
    @items = Items.all
    @images = Image.all
  end

  def show
  end

  def destroy
  end

  def update
  end

end
