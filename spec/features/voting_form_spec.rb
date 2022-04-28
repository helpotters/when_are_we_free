require 'rails_helper'

RSpec.feature 'VotingForms', type: :feature do
  let(:event) { create(:event) }
  let(:duration) { event.start_date..event.end_date }
  let(:availability) { duration.to_a.sample(rand(1..duration.count)) }

  before do
    visit event_url(event.id)
    find(:test_id, 'name').fill_in(with: Faker::Movies::LordOfTheRings.character)
  end
  context 'does not fill in availability' do
    it 'just submits name' do
      find(:test_id, 'submit').click
      expect(Voter.last.votes.count).to eq(0)
    end
  end
  context 'does fill in availability' do
    it 'fills in every day of availability' do
      days = page.all(:test_id, 'calendar_day')
      days.each do |day|
        day.click if availability.include?(Date.parse(day[:id]))
      end

      find(:test_id, 'submit').click
      expect(Voter.last.votes.count).to eq(availability.count)
    end
  end
end
