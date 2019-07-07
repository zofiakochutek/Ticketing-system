FactoryBot.define do
  factory :event do
    name { Faker::Lorem.word }
    date { Faker::Time.between(DateTime.now - 10, DateTime.now) }  
    time { Faker::Number.decimal(2) }
    available_tickets {Faker::Number.within(1..1000) }
    ticket_price { Faker::Number.decimal(2) }
  end
end