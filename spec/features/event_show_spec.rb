require 'rails_helper'

RSpec.feature 'EventShow', type: :feature do
  let(:event) { create(:event) }
  let(:title) { event.title }
  let(:description) { event.description }
  let(:start_date) { event.start_date }
  let(:end_date) { event.end_date }
  before do
    visit "events/#{event.id}"
  end

  context 'View Basic Information' do
    it 'should have event title' do
      expect(find(:test_id, 'event_title')).to have_content(title)
    end
    it 'should have event description' do
      expect(find(:test_id, 'event_description')).to have_content(description)
    end
    it 'should have event start date' do
      expect(find(:test_id, 'event_start_date')).to have_content(start_date)
    end
    it 'should have event end date' do
      expect(find(:test_id, 'event_end_date')).to have_content(end_date)
    end
  end
end
