FactoryBot.define do
  factory :customer do

    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    # email { Faker::Internet.email }
    # Fazendo uso de sequence para gerar email dinâmico
    sequence(:email) { |n|  "email#{n}@gmail.com"}
    
    trait :male do
      gender {'M'}
    end

    trait :female do
      gender {'F'}
    end
  
    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end
  
    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    # Ao transformar a factory default, male, female em trait 
    # podemos criar novas factorys da seguinte forma:
    factory :customer_default, traits: [:default]
    factory :customer_default_male, traits: [:default, :male]
    factory :customer_default_female, traits: [:default, :female]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  
  end

end