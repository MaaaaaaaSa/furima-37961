class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :product_description, :category_id, :item_condition_id, :postage_id, :prefecture_id,
                                 :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
