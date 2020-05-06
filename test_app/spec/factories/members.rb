FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
