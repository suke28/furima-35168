require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
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
    it '電話番号にはハイフンが不要であること' do
      @purchase_delivery_address.phone_number = '000-000-0000'
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Phone number Phone number is invalid. Input only number")
    end
    it '電話番号が12桁以上では登録できないこと' do
      @purchase_delivery_address.phone_number = '0000000000000'
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Phone number Phone number is too short")
    end
    it 'user_idが空では登録できないこと' do
      @purchase_delivery_address.user_id = ''
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できないこと' do
      @purchase_delivery_address.item_id = ''
      @purchase_delivery_address.valid?
      expect(@purchase_delivery_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
