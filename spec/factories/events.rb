FactoryBot.define do
  factory :event do
    title { Faker::Kpop.iii_groups }
    description { Faker::Movies::HarryPotter.quote }
    minimum { 3 }
    start_date { Date.today }
    end_date { Faker::Date.forward(days: rand(2..32)) }

    factory :event_with_minimum do
      transient do
        list_count { 5 }
      end
      after :create do |created_event, evaluator|
        create_list(:confirmed_voter, evaluator.list_count, event: created_event)
      end
    end
  end
end
