class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :day_to_ship_id, :delivery_charge_id,
                                 :delivery_source_id, :price).merge(user_id: current_user.id)
  end
end
