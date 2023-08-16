FactoryBot.define do
  factory :item do
    item_name        { Faker::Name.initials(number: 2) }
    item_text        { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 12) }
    condition_id     { Faker::Number.between(from: 2, to: 4) }
    charge_id        { Faker::Number.between(from: 2, to: 8) }
    area_id          { Faker::Number.between(from: 1, to: 48) }
    scheduled_day_id { Faker::Number.between(from: 2, to: 5) }
    price            { Faker::Number.between(from: 300, to: 10000000) }
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
