FactoryBot.define do
  factory :voter do
    name { Faker::Movies::HarryPotter.character }
    event { create(:event) }
    email { Faker::Internet.email }
  end
end
