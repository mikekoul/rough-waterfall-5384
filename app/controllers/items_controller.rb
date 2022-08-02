class ItemsController < ApplicationController
  def index
    @supermarket = Supermarket.find(params[:id])
    @items = Item.joins(:customers).where("supermarket_id = ?", @supermarket.id).distinct
  end
end