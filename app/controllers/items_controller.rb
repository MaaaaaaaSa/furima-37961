class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :condition_item, only: [:edit, :update, :destroy]

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

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :product_description, :category_id, :item_condition_id, :postage_id, :prefecture_id,
                                 :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def condition_item
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
