require 'rails_helper'

RSpec.feature 'VotingForms', type: :feature do
  let(:event) { create(:event) }
  let(:duration) { event.start_date..event.end_date }
  let(:name) { Faker::JapaneseMedia::DragonBall.character }

  before do
    visit new_voter_path
  end

  # Can select any day in calendar
  def self.fill_forms(availability)
    it 'select days in calendar' do
      page.all(:test_id, 'day').each do |day|
        day.click if availability.include?(day.value)
      end
    end
  end

  context 'does not fill required fields' do
    it 'fills in name but not calendar' do
      not_available = nil
      find(:test_id, 'name').fill_in with(nil)

      expect(page).to have_content('cannot be empty')
    end
  end
  xcontext 'does fill required fields' do
    it 'fills in name and calendar' do
      availability = duration.sample

      find(:test_id, 'name').fill_in with(:name)

      fill_forms(availability)
    end
  end
end
