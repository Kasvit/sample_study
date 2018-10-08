FactoryBot.define do
  factory :item do
    title { Faker::Name.first_name }
    description { Faker::Name.last_name }
    price { Faker::Educator.degree }
  end
end