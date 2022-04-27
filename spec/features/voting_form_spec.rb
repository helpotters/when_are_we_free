require 'rails_helper'

RSpec.feature 'VotingForms', type: :feature do
  let(:event) { create(:event) }
  let(:duration) { event.start_date..event.end_date }
  let(:name) { Faker::JapaneseMedia::DragonBall.character }

  before do
    visit event_url(event.id)
  end
  context 'does fill required fields' do
    it 'should fill in each correct date from availability' do
      # random generated availbility
      availbility = duration.map(&:to_s).sample(rand(1..(duration.count)))

      page.all(:test_id, 'day').each do |day|
        day.click if availability.include?(day.value)
      end

      days = find(:test_id, 'days_submitted')
      expect(days).to have_content(availability.count)
      expect(page).to have_content(name)
    end
  end
  context 'does not fill required fields' do
    it 'fills in name but not calendar' do
      find(:test_id, 'name').fill_in with: name
      find(:test_id, 'submit').click

      expect(page).to have_current_path(event_url(event.id))
      expect(page).to have_content(name)
    end
  end
end
