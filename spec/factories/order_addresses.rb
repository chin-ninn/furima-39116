FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    area_id       { Faker::Number.between(from: 1, to: 48) }
    city          { '横浜市' }
    house_number  { '青山1-1' }
    building_name { '東京ハイツ202' }
    phone_number  { '0123456789' }
    association :user
    association :item
  end
end
