FactoryBot.define do
  factory :event do
    title { Faker::Kpop.iii_groups }
    description { Faker::Movies::HarryPotter.quote }
    start_date { Date.today }
    end_date { Faker::Date.forward(days: 31) }
  end
end
