FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Number.between(0, 100) }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1800, 2018) }
  end

  factory :user do
    email { Faker::Internet.email }
    password { '123123123' }
    password_confirmation { '123123123' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
