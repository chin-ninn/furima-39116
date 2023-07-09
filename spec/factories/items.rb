FactoryBot.define do
  factory :item do
    item_name    { Faker::Name.initials(number: 2) }
    item_text    { Faker::Lorem.sentence }
    category_id  { Faker::Number.between(2, 11) }
    condition_id { Faker::Number.between(2, 3) }
    charges_id   { Faker::Number.between(2, 7) }
    area_id      { Faker::Number.between(2, 47) }
    days_id      { Faker::Number.between(2, 4) }
    price        { Faker::Number.between(300, 9999999) }
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename:'test_image.png')
    end
  end
end
