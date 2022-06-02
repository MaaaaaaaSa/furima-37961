class OrdersController < ApplicationController

  def index
    @order_deliverie = OrderDeliverie.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_deliverie = OrderDeliverie.new(order_params)
    if @order_deliverie.valid?
      @order_deliverie.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_deliverie).permit(:postal_code, :prefecture_id, :citys, :address, :building_name, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end

end
