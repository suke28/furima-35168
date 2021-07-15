class ItemsController < ApplicationController
  before_action :authenticate_user!, {only: [:new]}
  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(items_params)
  end

  private
  def items_params
    params.require(:items).permit(:image, :name, :description, :category_id, :condition_id, :day_to_ship_id, :delivery_charge_id, :delivery_source_id,).merge(user_id: current_user.id)
  end
end
