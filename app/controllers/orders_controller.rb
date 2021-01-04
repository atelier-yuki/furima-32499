class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_num, :address_id, :city, :block, :building, :tell)
  end
end
end
