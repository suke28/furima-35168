class DeliveryAddress < ApplicationRecord
  belongs_to :purchase

  validates :postal_code, :city, :block, :building_name, :phone_number, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_source
end
