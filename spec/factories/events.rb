FactoryBot.define do
  factory :event do
    title { Faker::Kpop.iii_groups }
    description { Faker::String.random }
    data { Faker::Date.forward(days: 31) }
  end
end
