FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Number.between(0, 100) }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1800, 2018) }
  end
end
