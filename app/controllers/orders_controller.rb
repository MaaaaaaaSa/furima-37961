class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_deliverie = OrderDeliverie.new
    if user_signed_in?
      if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
      end
    else
      redirect_to user_session_path
    end
  end

  def create
    @order_deliverie = OrderDeliverie.new(order_params)
    if @order_deliverie.valid?
      pay_item
      @order_deliverie.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_deliverie).permit(:postal_code, :prefecture_id, :citys, :address, :building_name, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
