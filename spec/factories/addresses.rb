FactoryBot.define do
  factory :address do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana {"テック"}
    last_name_kana {"キャンプ"}
    zip_code { Faker::Address.zip_code}
    prefecture { Faker::Address.state}
    city { Faker::Address.city}
    town { Faker::Address.city}
    number { Faker::Number.number(digits: 4)}
    building { Faker::Address.building_number}
    telephone {Faker::Number.number(digits: 11)}
    association :user 
    
  end
end
