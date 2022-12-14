FactoryBot.define do
  factory :voter do
    name { Faker::Movies::HarryPotter.character }
    event { create(:event) }
    email { Faker::Internet.email }

    factory :confirmed_voter do
      after :create do |confirmed|
        create(:vote, voter: confirmed, event: confirmed.event,
                      day: confirmed.event.start_date + 4)
      end
    end
  end
end
