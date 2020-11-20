FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { "00000000" }
    password_confirmation { "00000000" }
    first_name { "テック" }
    last_name { "太郎" }
    first_name_kana { "てっく" }
    last_name_kana { "たろう" }
    birthday { Faker::Date.birthday }
    created_at { Faker::Time.between(from: DateTime.now - 3, to: DateTime.now - 2) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end

end
