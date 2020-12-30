class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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