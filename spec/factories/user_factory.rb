FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123123123' }
    password_confirmation { '123123123' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
