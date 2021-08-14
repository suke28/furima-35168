FactoryBot.define do
  factory :purchase_delivery_address do
    postal_code { '123-4567' }
    city { '東京都' }
    block { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '00000000000' }
    delivery_source_id { 2 }
    user_id { 1 }
    item_id { 1 }
  end
end
