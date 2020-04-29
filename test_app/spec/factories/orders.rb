FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order nº#{n}" }
    # O factorybot verifica se existe uma factory customer e caso sim já instância uma factory para popular este campo.
    customer
  end
end
