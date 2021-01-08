class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item

  def index
    @order = Order.new

    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
       pay_item
      @order.save
      redirect_to root_path, notice: '購入を完了しました'
    else
      render :index, notice: '購入は完了しておりません'
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_num, :address_id, :city, :block, :building, :tell).
    merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
