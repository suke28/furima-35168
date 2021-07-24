class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.order('created_at DESC')
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :day_to_ship_id, :delivery_charge_id,
                                 :delivery_source_id, :price).merge(user_id: current_user.id)
  end
end
