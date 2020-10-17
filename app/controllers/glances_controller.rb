class GlancesController < ApplicationController
  def index
    @items = Item.all
  end

end
