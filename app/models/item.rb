class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :image, :name, :description, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day_to_ship
  belongs_to :delivery_charge
  belongs_to :delivery_source

  validates :category_id, :condition_id, :day_to_ship_id, :delivery_charge_id, :delivery_source_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
