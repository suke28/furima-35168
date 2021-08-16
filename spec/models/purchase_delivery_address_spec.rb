require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_delivery_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @purchase_delivery_address.building_name = ''
      expect(@purchase_delivery_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @purchase_delivery_address.postal_code = ''
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_delivery_address.postal_code = '1234567'
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include('Postal code Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it 'delivery_sourceを選択していないと保存できないこと' do
      @purchase_delivery_address.delivery_source_id = 0
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Delivery source Delivery source can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_delivery_address.city = ''
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @purchase_delivery_address.block = ''
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Block can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_delivery_address.phone_number = ''
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @purchase_delivery_address.token = nil
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
