FactoryBot.define do
    factory :ticket do
      price { Faker::Number.digit }
      event_id nil
    end
  end