FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position { Faker::Educator.degree }
    password '12345678'
    password_confirmation '12345678'
    rating     7   
    after(:build) do |culture|
      filename = ["avatar1.jpg", "avatar2.jpg", "avatar3.jpg", "avatar4.jpg", "avatar5.jpg", "avatar6.jpg", "avatar7.jpg"].sample
      culture.avatar.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', filename)), filename: 'avatar.jpg', content_type: 'image/jpg')
    end
  end
end