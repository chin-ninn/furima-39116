FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { person.first.kanji }
    first_name            { person.last.kanji }
    family_name_reading   { person.first.katakana }
    first_name_reading    { person.last.katakana }
    birth                 { Faker::Date.backward }
  end
end
