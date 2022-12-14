FactoryBot.define do
  factory :event do
    title { Faker::Kpop.iii_groups }
    description { Faker::Movies::HarryPotter.quote }
    start_date { Date.today }
    end_date { Faker::Date.forward(days: rand(2..32)) }

    factory :event_with_minimum do
      after :create do |created_event|
        create_list(:confirmed_voter, 5, event: created_event)
      end
    end
  end
end
