FactoryBot.define do
  factory :payment do
    amount { Faker::Number.decimal(2)}
    token { Faker::Number.number(10) }  
    currency { 'EUR' }
  end
end
