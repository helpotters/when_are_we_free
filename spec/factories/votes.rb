FactoryBot.define do
  factory :vote do
    voter { create(:voter) }
    event { create(:event) }
    day { rand(event.start_date..event.end_date) }
  end
end
