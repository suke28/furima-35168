class PurchaseDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :block, :building_name, :phone_number, :item_id, :user_id, :delivery_source_id, :token
  validates :token, presence: true
  with_options presence: true do
    validates :user_id, :city, :block, :phone_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postal code is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "Phone number is too short"}
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "Phone number is invalid. Input only number"}  
  end
  validates :delivery_source_id, numericality: {other_than: 0, message: "Delivery source can't be blank"}
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(postal_code: postal_code, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id, delivery_source_id: delivery_source_id, token: token)
  end
end