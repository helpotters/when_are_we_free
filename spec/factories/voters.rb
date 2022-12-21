FactoryBot.define do
  factory :voter do
    sequence(:name) { |n| "person#{n}" }
    event { create(:event) }

    factory :confirmed_voter do
      email { Faker::Internet.email }
      after :create do |confirmed|
        create(:vote, voter: confirmed, event: confirmed.event,
                      day: confirmed.event.start_date + 4)
      end
    end
  end
end
