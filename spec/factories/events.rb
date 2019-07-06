FactoryBot.define do
    factory :event do
      name { Faker::Lorem.word }
      # date { Time.now.to_i }
      # date { Faker::Number.number(10).to_i }
      date { Faker::Time.between(DateTime.now - 10, DateTime.now) }  
      tickets_quantity {Faker::Number.within(1..1000) }
    end
  end