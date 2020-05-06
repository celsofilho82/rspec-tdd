FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { "password_123" }
    password_confirmation { "password_123" }
  end
end
