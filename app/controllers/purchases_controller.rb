class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_delivery_address = PurchaseDeliveryAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_delivery_address.valid?
      pay_item
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery_address).permit(:postal_code, :city, :block, :building_name, :phone_number, :delivery_source_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
