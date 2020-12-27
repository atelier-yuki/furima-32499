class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def show
  end

  private
  def item_params
    params.require(:item).
    permit(:item_name, :discription, :category_id, :item_state_id, :delivery_charge_id, :address_id, :delivery_day_id, :price, :image).
    merge(user_id: current_user.id)
  end
end
