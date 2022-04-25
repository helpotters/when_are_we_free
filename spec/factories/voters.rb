FactoryBot.define do
  factory :voter do
    name { Faker::Movies::HarryPotter.character }
    event { create(:event) }
  end
end
